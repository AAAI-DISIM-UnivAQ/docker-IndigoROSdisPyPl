# This is an auto generated Dockerfile for ros:desktop-full
# generated from docker_images/create_ros_image.Dockerfile.em
FROM osrf/ros:indigo-desktop-trusty

# install ros packages
RUN apt-get update && apt-get install -y \
    ros-indigo-desktop-full=1.1.5-0* \
&& rm -rf /var/lib/apt/lists/*

# This is an auto generated Dockerfile for gazebo:gzweb6
# generated from docker_images/create_gzweb_image.Dockerfile.em
FROM gazebo:libgazebo6

# install packages
RUN apt-get update && apt-get install -q -y \
    build-essential \
    cmake \
    imagemagick \
    libboost-all-dev \
    libgts-dev \
    libjansson-dev \
    libtinyxml-dev \
    mercurial \
    nodejs \
    nodejs-legacy \
    npm \
    pkg-config \
    psmisc \
    xvfb\
    && rm -rf /var/lib/apt/lists/*

# install gazebo packages
RUN apt-get update && apt-get install -q -y \
    libgazebo6-dev=6.7.0-1* \
    && rm -rf /var/lib/apt/lists/*

# clone gzweb
RUN hg clone https://bitbucket.org/osrf/gzweb ~/gzweb

# build gzweb
RUN cd ~/gzweb \
    && hg up default \
    && xvfb-run -s "-screen 0 1280x1024x24" ./deploy.sh -m

# setup environment
EXPOSE 8080
EXPOSE 7681

# run gzserver and gzweb
CMD ./root/gzweb/start_gzweb.sh && gzserver