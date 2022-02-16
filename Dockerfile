FROM osrf/ros:melodic-desktop-full-bionic

# add sudo user
ENV USERNAME ros
ENV HOME /home/$USERNAME
RUN useradd -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod -aG sudo $USERNAME && \
        echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
        chmod 0440 /etc/sudoers.d/$USERNAME && \
        # Replace 1000 with your user/group id
        usermod  --uid 1000 $USERNAME && \
        groupmod --gid 1000 $USERNAME

# install packages
RUN apt update && apt install -y --no-install-recommends \
        zsh \
        wget \
        neovim \
        tmux \
        && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*  # remove apt packages list

User ros
WORKDIR $HOME

# create a catkin workspace
RUN mkdir -p ~/catkin_ws/src && \
        pushd ~/catkin_ws && \
        source /ros_entrypoint.sh && \
        catkin_make && \
        popd