# docker-IndigoROSdisPyPl
A Docker container with Ubuntu 14, ROS Indigo, Gazebo, Redis, Python 3 and SWI-Prolog (it is compatible with SICStus Prolog and contains all its dependencies, so you can buy and install it too inside this container). \
ROS ad the catkin workspace are still configured and you just can use all the environment without the need to configure them, but if you have to change something in the configuration please see the point 5. of the instructions below.

## Instructions:
1.  **To get the Docker container:** \
        ```sh
        docker pull agnesesalutari/docker-indigorosdispypl
        ```
2.  **To allow visualization:** \
        &nbsp; xhost +local:root
3.  **To run the container (you have tu use this command for the very first time you run the container only):** \
        &nbsp; docker run -it \\ \
        &nbsp; --name="IndigoROSdisPyPl" \\ \
        &nbsp; --env="DISPLAY" \\ \
        &nbsp; --env="QT_X11_NO_MITSHM=1" \\ \
        &nbsp; --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \\ \
        &nbsp; agnesesalutari/docker-indigorosdispypl \\ \
        &nbsp; rqt \
        &nbsp; export containerId=$(docker ps -l -q)
 4.  **To work inside the container:** \
        &nbsp; docker exec -it "IndigoROSdisPyPl" bash
 5.  **(OPTIONAL) To re-configure ROS use the following lines, changing the parameter values, if needed:** \
        &nbsp; export ROS_MASTER_URI="http://127.0.0.1:11311" \
        &nbsp; export ROS_HOSTNAME="127.0.0.1" \
        &nbsp; export ROS_IP="127.0.0.1"
 6. **To add ROS environment variables to the bash:** \
        &nbsp; echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc \
        &nbsp; source ~/.bashrc
 6. **Create catkin workspace:** \
        &nbsp; mkdir -p ~/catkin_ws/src \
        &nbsp; cd ~/catkin_ws/src \
        &nbsp; catkin_init_workspace
 7. **Test:** \
        &nbsp; cd ~/catkin_ws/ \
        &nbsp; catkin_make \
        &nbsp; source devel/setup.bash
 8. **In order to reference the newly created local workspace in your bashrc (to make tools, like roslaunch and rosrun, able to  
     find the customly created packages):** \
        &nbsp; source catkin_ws/devel/setup.bash
 9.  **To open Gazebo GUI:** \
    &nbsp; gazebo **or** roslaunch gazebo YourFile.launch **or** rosrun gazebo_ros YourExecutable
 10. **To exit the container:** \
    &nbsp; exit
 11.  **(IMPORTANT) To save the container state, not to lose your work on it:** \
    &nbsp; docker commit "IndigoROSdisPyPl"
 12.  **To stop the container:** \
    &nbsp; docker stop "IndigoROSdisPyPl"
 13.  **After using the container:** \
    &nbsp; xhost -local:root
 14.  **Tu run the container again:** \
    &nbsp; docker start "IndigoROSdisPyPl"
