# ROS-playground

## docker

[osrf官方ROS镜像列表](https://hub.docker.com/r/osrf/ros), [ROS Melodic桌面版列表](https://hub.docker.com/r/osrf/ros/tags?page=1&name=melodic)

[ROS的docker教程](http://wiki.ros.org/docker/Tutorials/Docker) 把`ros_entrypoint.sh`调用的配置文件改成`setup.zsh`

参考[sdkmanager用容器](https://github.com/atinfinity/sdk_manager_docker)创建ROS容器

[A Guide to Docker and ROS](https://roboticseabass.com/2021/04/21/docker-and-ros/)

```shell
# 下载镜像
docker pull osrf/ros:melodic-desktop-full-bionic
# 列出所有镜像 (加-q不显示表头)
docker images -a
# 删除指定镜像 (-f强制)
docker rmi <IMAGE ID>
# 列出容器
docker ps  # 当前运行的
docker ps -a  # 所有的
# 删除容器
docker rm [CONTAINER ID]
# 删除所有容器
docker rm $(docker ps -a -q)
# 创建名为ros_playground的新镜像
docker build -t ros_playground .
# 以ros_playgroundw创建并进入容器名为base的容器 (用户为ros)
./container_create.sh
# 启动已停止的容器 (Y)
docker start [CONTAINER NAME]
# 进入运行中的容器 (用id也可以)
docker exec -it [CONTAINER NAME] t
# 停止容器
docker stop [CONTAINER NAME]
```

## ROS

- [ROS中有用工具概述](http://wiki.ros.org/Tools)
- [ROS官方中文教程列表](http://wiki.ros.org/cn/ROS/Tutorials)
- [微雪的ROS教程](https://www.waveshare.net/study/portal.php?mod=list&catid=68)

```shell
# 查看ROS_ROOT和ROS_PACKAGE_PATH值, 查看ROS_PACKAGE_PATH是为了当前工作空间在环境最顶层
printenv | grep ROS
# 创建并构建一个catkin工作空间
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make
# 创建catkin软件包
cd src
# catkin_create_pkg <package_name> [depend1] [depend2] [depend3]
catkin_create_pkg beginner_tutorials std_msgs rospy roscpp
# 然后回根目录编译
cd ..
catkin_make
source devel/setup.zsh  # 加载环境变量
```

rospack, roscd和rosls

```shell
rospack find [package_name]
roscd  [locationname[/subdir]]  # 只能切换到包含在ROS_PACKAGE_PATH环境中的包
roscd log  # 进日志文件目录
rosls [locationname[/subdir]]
```

### 导航

- [Autolabor-机器人导航](http://www.autolabor.com.cn/book/ROSTutorials/di-7-zhang-ji-qi-ren-dao-822a28-fang-771f29.html)
- [知乎-ROS自带路径规划模块以及仿真](https://zhuanlan.zhihu.com/p/118510973)
- [古月居-ROS探索总结（十四）—— move_base（路径规划）](https://www.guyuehome.com/270)
