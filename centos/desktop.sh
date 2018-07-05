#!/bin/sh

#安装图形界面
echo "install kde"
yum -y groupinstall "KDE Plasma Workspaces"
#echo "install gnome"
#yum -y groupinstall "GNOME Desktop"

#设置默认登录桌面环境
echo "systemctl set-default graphical.target"
systemctl set-default graphical.target