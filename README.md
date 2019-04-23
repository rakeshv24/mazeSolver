# mazeSolver

## 1. Install ros-kinetic-turtlebot 

`sudo apt-get install ros-kinetic-turtlebot-simulator ros-kinetic-turtlebot-teleop`

## 2. Clone this repository

## 3. Mounting Hokuyo Laser Scanner onto the Turtlebot

`cd ~/opt/ros/kinetic/share`

`sudo rm -r turtlebot_description`

`cd ~/{PATH_to_repo}/Model_files`

`sudo mv turtlebot_description /opt/ros/kinetic/share`

`echo "export TURTLEBOT_3D_SENSOR=hokuyo" >> ~/.bashrc`

`source ~/.bashrc`

`roslaunch turtlebot_gazebo turtlebot_world.launch`

## 4. Loading Maze into Gazebo

`rosrun gazebo_ros spawn_model -file ~/{PATH_to_repo}/Model_files/maze_model/model.sdf -sdf -model -maze`

## 5. Run the program

`cd ~/{PATH_to_repo}`

`source install/setup.bash`

`roslaunch maze mazeSolver.launch start_mazeSolver:=True`

`rosservice call /mazesolver "solver_flag: true"`


