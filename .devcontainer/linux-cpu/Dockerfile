# Core ROS2 Development Container - CPU Version
FROM althack/ros2:jazzy-gazebo

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y --no-install-recommends \
    apt-utils \
    build-essential \
    cmake \
    curl \
    default-jre \
    dialog \
    gedit \
    gnupg \
    grep \
    less \
    lsb-release \
    nano \
    wget

# Install core development dependencies
RUN apt install -y \
    build-essential \
    chrony \
    cmake \
    git \
    gstreamer1.0-alsa \
    gstreamer1.0-gl \
    gstreamer1.0-gtk3 \
    gstreamer1.0-libav \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-pulseaudio \
    gstreamer1.0-qt5 \
    gstreamer1.0-tools \
    gstreamer1.0-x \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libboost-all-dev \
    libboost-date-time-dev \
    libbullet-dev \
    libeigen3-dev \
    libglew-dev \
    libglfw3-dev \
    libgstreamer-plugins-base1.0-dev \
    libgstreamer1.0-dev \
    libgtk-3-dev \
    libjsoncpp-dev \
    libpcl-dev \
    libswscale-dev \
    libtclap-dev \
    neofetch \
    openssh* \
    python3-colcon-common-extensions \
    python3-colcon-installed-package-information \
    python3-colcon-override-check \
    python3-flake8 \
    python3-pip \
    python3-pytest-cov \
    python3-rosdep \
    python3-setuptools \
    python3-vcstool \
    sshpass \
    libgz-math7

# Install core ROS2 packages (shared by all robots)
RUN apt update && apt -y install --no-install-recommends \
    ros-${ROS_DISTRO}-ament-cmake \
    ros-${ROS_DISTRO}-diagnostic-aggregator \
    ros-${ROS_DISTRO}-gazebo-* \
    ros-${ROS_DISTRO}-image-pipeline \
    ros-${ROS_DISTRO}-imu-tools \
    ros-${ROS_DISTRO}-nav2-bringup \
    ros-${ROS_DISTRO}-navigation2 \
    ros-${ROS_DISTRO}-pcl-ros \
    ros-${ROS_DISTRO}-ros2-control \
    ros-${ROS_DISTRO}-ros2-controllers \
    ros-${ROS_DISTRO}-rqt-* \
    ros-${ROS_DISTRO}-rviz2 \
    ros-${ROS_DISTRO}-test-msgs \
    ros-${ROS_DISTRO}-xacro \
    ros-${ROS_DISTRO}-cartographer-ros

# Install common hardware support
RUN apt update && apt install -y --no-install-recommends \
    can-utils \
    joystick

# Clean up
RUN apt update \
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=dialog

# Set up auto-source of workspace for ros user
ARG WORKSPACE
RUN echo "if [ -f ${WORKSPACE}/ros2_ws/install/setup.bash ]; then source ${WORKSPACE}/ros2_ws/install/setup.bash; fi" >> /home/ros/.bashrc
