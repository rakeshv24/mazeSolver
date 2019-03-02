#include <maze/wall_det.hpp>

using namespace std;

WallDetect::WallDetect():_spinner(4)
{
	_spinner.start();

	_laser_sub = _nh.subscribe("/laserscan", 1, & WallDetect::laserCb, this);
  _odom_sub = _nh.subscribe("/odom", 1, & WallDetect::odomCb, this);

  _vel_pub = _nh.advertise < geometry_msgs::Twist > ("/mobile_base/commands/velocity", 5);

  _wall_det_service = _nh.advertiseService("mazesolver/wall_detection", & WallDetect::serviceCb, this);

  initParams();

}

WallDetect::~WallDetect()
{
	_spinner.stop();
}

void WallDetect::initParams()
{
	_flag = false;
	_minLaserValues = 60;
	_intervalEpsilon = 1.5;
	_distanceToWall = 0.4;
	_angle = 1.57;
}

void WallDetect::laserCb(const sensor_msgs::LaserScan::ConstPtr &laser)
{
	WriteLock lock(_laser_mutex);
	_laser_ptr = laser;	
}

void WallDetect::odomCb(const nav_msgs::Odometry::ConstPtr &odom)
{
	WriteLock lock(_odom_mutex);
	_odom_ptr = odom;	
}

bool WallDetect::serviceCb(maze::det_srv::Request  &req,  maze::det_srv::Response &res)
{
	bool flag;
	if(req.detection_flag)
	{

		flag = wallDetection(req.actMinLaserValue, req.turnSpeed);
		//ROS_INFO("[Maze Solver] Wall Detection executed successfully");
		res.success = flag;
	}
}

bool WallDetect::wallDetection(float actMinLaserValue, float turnSpeed)
{
	_det_mutex.lock();
	_flag = false;
	int j = 0;
	int end = 0;
	int getLaserIndex;
	float tmpAngle;
	auto ranges = _laser_ptr->ranges;
	int ranges_len = ranges.size();
	if(actMinLaserValue<_distanceToWall)
	{
		rotate_angle(_angle, turnSpeed);
	}
	else
	{
		//std::vector<std::vector<float>> arrVal;
		std::vector<float> arrVal1;
		std::vector<float> arrVal2;
		//int arrVal1[100],arrVal2[100];
		int i = 0;
		while(i< ranges_len)
		{
			int valCounter = 0;
			for(int k=i+1; k< ranges_len; k++)
			{
				if((ranges[i]-_intervalEpsilon)<=ranges[k]<=(ranges[i]+_intervalEpsilon))
					valCounter += 1;
				else
				{
					if(valCounter>_minLaserValues)
					{
						//arrVal.push_back(std::vector<float>());
						arrVal1.push_back(i);
						arrVal2.push_back(k);
						//arrVal1[j] = i;
						//arrVal2[j] = k;
						//j++;
					}
					valCounter = 0;
					i = k;
				}
				if(k==ranges_len-1)
					i = ranges_len;
			}

		}
		getLaserIndex = 180;
		if(arrVal1.empty()==false && arrVal2.empty()==false)
		{
			auto max_i = *max_element(arrVal1.begin(), arrVal1.end());
			auto max_k = *max_element(arrVal2.begin(), arrVal2.end());
			//float a = float(max_k);
			getLaserIndex = int(floor((float(max_i) + float(max_k)/2)));
		}
		if(getLaserIndex<=175 || getLaserIndex>=185)
		{
			tmpAngle = _laser_ptr->angle_min + (getLaserIndex * _laser_ptr->angle_increment);
			if(getLaserIndex<170)
			{
				rotate_angle(abs(tmpAngle),-0.3);
			}
			else
			{
				rotate_angle(abs(tmpAngle),0.3);
			}
		}
		_flag = true;
	}
	_det_mutex.unlock();
	return _flag;
}

void WallDetect::rotate_angle(float angle, float speed)
{
	_rot_mutex.lock();
	
	float angular_speed = speed;
	float relative_angle = angle;
	_vel.linear.x = 0.0;
	_vel.angular.z = angular_speed;

	float t0 = ros::Time::now().toSec();
	float curren_angle = 0;

	while(curren_angle < relative_angle)
	{
		_vel_pub.publish(_vel);
		float t1 = ros::Time::now().toSec();
		curren_angle = abs(angular_speed)*(t1-t0);
	}

	_vel.linear.x = 0.0;
	_vel.angular.z = 0;
	_vel_pub.publish(_vel);

	_rot_mutex.unlock();
}

int main(int argc, char** argv) 
{
  ros::init(argc, argv, "wall_detection_node");
  WallDetect obj;
  ros::waitForShutdown();
  return 0;
}