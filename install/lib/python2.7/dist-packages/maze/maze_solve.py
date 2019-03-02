#! /usr/bin/env python
import rospy
from threading import Thread, Lock
import math
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from pid import PID
import time as time
import actionlib
from maze.srv import det_srv,solver
from maze.msg import m_goal,mazeSolverAction, mazeSolverGoal


def wall_det_service(flag,actMinLaserValue,turnSpeed):
    rospy.wait_for_service('mazesolver/wall_detection')
    try:
        handle = rospy.ServiceProxy('mazesolver/wall_detection', det_srv)
        resp = handle(flag,actMinLaserValue,turnSpeed)
        #print resp
        return resp.success
    except rospy.ServiceException, e:
        rospy.logerr("Service call failed %s", e)

def action_client():
    client = actionlib.SimpleActionClient('action_server_node', mazeSolverAction)
    client.wait_for_server()
    action_goal = mazeSolverGoal()
    action_goal.goal = 1
    client.send_goal(action_goal)
    client.wait_for_result()
    return client.get_result()


class MazeSolver:

    def __init__(self):
        self.rate = rospy.Rate(10)
        self.initialize_sub_pub()
        self.initialize_params()
        self.driveState = "WallDetection"
        self.pid = PID(self.kp, self.ki, self.kd, self.outMin, self.outMax, self.iMin, self.iMax)
        rospy.Timer(rospy.Duration(0.1), self.startSolver)

    def initialize_sub_pub(self):
    	self.laser_sub = rospy.Subscriber('/laserscan', LaserScan, self.laserscan_callback)
        self.odom_sub = rospy.Subscriber('/odom', Odometry, self.odom_callback)
        self.vel_pub = rospy.Publisher('/mobile_base/commands/velocity', Twist, queue_size = 5)
        self.goal_pub = rospy.Publisher('/mazesolver/goal', m_goal, queue_size = 1)

    def initialize_params(self):
    	self.vel = Twist()
        self.maze_goal = m_goal()
        self._flag = False
        self.laser = None
        self.odom = None
        self.minLaserValues = 60
        self.intervalEpsilon = 1.5
        self.mutex2 = Lock()
        self.knownPoints = []
        self.epsilonAroundPoints = 0.1
        self.timeoutForDetection = 12
        self.leftHand = True
        self.laserIndex = 359
        self.turnSpeed = -0.3
        self.distanceToWall = 0.4
        self.counter = 0
        self.angle = 1.57
        self.minLasersSide = [120,170]
        self.mutex = Lock()
        self.kp = 6
        self.ki = 2
        self.kd = 1.5
        self.outMin = -0.4
        self.outMax = 0.4
        self.iMin = -0.4
        self.iMax = 0.4
        
    def odom_callback(self, odom_msg):
        self.odom = odom_msg

    def laserscan_callback(self, laser_msg):
        self.laser = laser_msg

    def startSolver(self,dummy):
        #rospy.loginfo("start Maze Solver Node")
        if self._flag:
            if(not self.leftHand):
                self.laserIndex = 0
                self.minLasersSide = [190, 240]
                self.turnSpeed *= (-1)

            if(self.laser and self.odom):

                if(len(self.knownPoints) == 0):
                    self.knownPoints.append([self.odom.pose.pose.position.x, self.odom.pose.pose.position.y, time.time()])

                actMinLaserValue = min(min(self.laser.ranges[170:190], self.laser.ranges[self.minLasersSide[0] : self.minLasersSide[1]]))

                #print actMinLaserValue
                if actMinLaserValue>20:
                    self.counter +=1

                if self.counter>100:
                    self.maze_goal.res = 1
                    self.goal_pub.publish(self.maze_goal)
                    

                else:


                    if(self.driveState == "WallDetection"):
                        self.vel.linear.x = 0.0
                        self.vel.angular.z = 0.0
                        flag = wall_det_service(True,actMinLaserValue,self.turnSpeed)
                        
                        if flag:
                        	self.driveState = "driveToWall"
                        self.pid.resetValues()

                    elif(self.driveState == "driveToWall"):
                        if(self.mutex.locked() == False):
                            if(actMinLaserValue <= self.distanceToWall):
                                self.knownPoints.append([self.odom.pose.pose.position.x,self.odom.pose.pose.position.y, time.time()])

                                self.vel.linear.x = 0.0
                                self.vel.angular.z = 0.0
                                self.rotate_angle(self.angle, self.turnSpeed)
                                self.driveState = "WallFollow"
                            else:
                                self.vel.linear.x = 0.3
                                self.vel.angular.z = 0.0

                    elif(self.driveState == "WallFollow"):
                        if(self.mutex.locked() == False):
                            for i in range(0, len(self.knownPoints)):
                                if(self.odom.pose.pose.position.x - self.epsilonAroundPoints <= self.knownPoints[i][0] <= self.odom.pose.pose.position.x + self.epsilonAroundPoints and
                                self.odom.pose.pose.position.y - self.epsilonAroundPoints <= self.knownPoints[i][1] <= self.odom.pose.pose.position.y + self.epsilonAroundPoints and
                                self.knownPoints[i][2] + self.timeoutForDetection <  time.time()):
                                    rospy.loginfo("Loop detected")
                                    self.driveState = "WallDetection"

                            self.wallFollower(actMinLaserValue)

                    self.maze_goal.res = 0
                    self.goal_pub.publish(self.maze_goal)
                    

                self.vel_pub.publish(self.vel)

            self.rate.sleep()


    def wallFollower(self, actMinLaserValue):
        try:
            pidValue = self.pid.pidExecute(self.distanceToWall, self.laser.ranges[self.laserIndex])

            if(self.leftHand):
                pidValue = pidValue * (-1)

            if(actMinLaserValue < self.distanceToWall):
                self.rotate_angle(self.angle, self.turnSpeed)
            elif(pidValue == 0):
                self.vel.linear.x = 0.3
                self.vel.angular.z = 0.0
            elif(pidValue != 0):
                self.vel.linear.x = 0.15
                self.vel.angular.z = pidValue

        except Exception as e:
            rospy.logerr_throttle(10, "Wall Follower Error")

    def rotate_angle(self, angle, speed):
        self.mutex.acquire()
        try:
            angular_speed = speed
            relative_angle = angle
            self.vel.linear.x = 0.0
            self.vel.angular.z = angular_speed

            t0 = rospy.Time.now().to_sec()
            current_angle = 0

            while(current_angle < relative_angle):
                self.vel_pub.publish(self.vel)
                t1 = rospy.Time.now().to_sec()
                current_angle = abs(angular_speed)*(t1-t0)

            self.vel.linear.x = 0.0
            self.vel.angular.z = 0
            self.vel_pub.publish(self.vel)
            self.pid.resetValues()
        finally:
            self.mutex.release()

    def serviceCB(self,req):
        if req.solver_flag:
            self._flag = True
            rospy.loginfo("Mission Started")
            result = action_client()
            #rospy.loginfo("hi")
            if result:
                self._flag = False
                rospy.loginfo("Mission Accomplished!!!")
            return True
        else:
            self._flag=False
            rospy.loginfo("Mission Stopped")
            return True


def main():
    rospy.init_node('Maze Solver', anonymous=True)
    obj=MazeSolver()
    s = rospy.Service('/mazesolver', solver, obj.serviceCB)
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print "shutting down the node"
