# docker-IndigoROSdisPyPl
A Docker container with Ubuntu 14, ROS Indigo, Gazebo, Redis, Python 3 and SWI-Prolog (it is compatible with SICStus Prolog and contains all its dependencies, so you can buy and install it too inside this container). \
ROS ad the catkin workspace are still configured and you just can use all the environment without the need to configure them, but if you have to change something in the configuration please see the point 5. of the instructions below.

## Instructions:
1. To get the Docker container:
```sh
docker pull agnesesalutari/docker-indigorosdispypl
```
2. To allow visualization (do this every time you run the container):
```sh
xhost +local:root
```
3. To run the container (you have tu use this command for the very first time you run the container only):
```sh
docker run -it \\
--name="IndigoROSdisPyPl" \\
--env="DISPLAY" \\
--env="QT_X11_NO_MITSHM=1" \\
--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \\
agnesesalutari/docker-indigorosdispypl \\
rqt
export containerId=$(docker ps -l -q)
```
 4. To work inside the container:
```sh
docker exec -it "IndigoROSdisPyPl" bash
```
 5. (OPTIONAL) To re-configure ROS use the following lines, changing the parameter values, if needed:
```sh
export ROS_MASTER_URI="http://127.0.0.1:11311"
export ROS_HOSTNAME="127.0.0.1"
export ROS_IP="127.0.0.1"
```
 6. To add ROS environment variables to the bash:
```sh
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc
```
 7. Create catkin workspace:
```sh
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
```
 8. Test:
```sh
cd ~/catkin_ws/
catkin_make
source devel/setup.bash
```
 9. In order to reference the newly created local workspace in your bashrc (to make tools, like roslaunch and rosrun, able to  
     find the customly created packages):
```sh
source catkin_ws/devel/setup.bash
```
 10. To open Gazebo GUI:
```sh
gazebo
```
or
```sh
roslaunch gazebo YourFile.launch
```
or
```sh
rosrun gazebo_ros YourExecutable
```
 11. To exit the container:
```sh
exit
```
 12. (IMPORTANT) To save the container state, not to lose your work on it (do this every time you need to save the state of the container, after exiting it and before stopping it):
```sh
docker commit "IndigoROSdisPyPl"
```
 13. To stop the container:
```sh
docker stop "IndigoROSdisPyPl"
```
 14. After using the container:
```sh
xhost -local:root
```
 15. Tu run the container again:
```sh
docker start "IndigoROSdisPyPl"
```
