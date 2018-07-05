#!/bin/sh

#安装oracle11g需要的库文件
echo "开始安装oracle11g需要的库文件"
#安装libaio和libaio-devel
echo "yum -y install libaio.x86_64 libaio.i686 libaio-devel.i686 libaio-devel.x86_64"
yum -y install libaio.x86_64 libaio.i686 libaio-devel.i686 libaio-devel.x86_64

#安装glibc和glibc-devel
echo "yum -y install glibc.x86_64 glibc.i686 glibc-devel.x86_64 glibc-devel.i686"
yum -y install glibc.x86_64 glibc.i686 glibc-devel.x86_64 glibc-devel.i686

#安装compat-libstdc++-33
echo "yum -y install compat-libstdc++-33.i686 compat-libstdc++-33.x86_64"
yum -y install compat-libstdc++-33.i686 compat-libstdc++-33.x86_64

#安装elfutils-libelf-devel
echo "yum -y install elfutils-libelf-devel.i686 elfutils-libelf-devel.x86_64"
yum -y install elfutils-libelf-devel.i686 elfutils-libelf-devel.x86_64

#安装gcc-c++
echo "yum -y install gcc-c++.x86_64"
yum -y install gcc-c++.x86_64

#安装libgcc
echo "yum -y install libgcc.x86_64 libgcc.i686"
yum -y install libgcc.x86_64 libgcc.i686

#安装libstdc++和libstdc++-devel
echo "yum -y install libstdc++.x86_64 libstdc++-devel.x86_64 libstdc++.i686 libstdc++-devel.i686"
yum -y install libstdc++.x86_64 libstdc++-devel.x86_64 libstdc++.i686 libstdc++-devel.i686

#安装unixODBC和unixODBC-devel
echo "yum -y install unixODBC.i686 unixODBC.x86_64 unixODBC-devel.i686 unixODBC-devel.x86_64"
yum -y install unixODBC.i686 unixODBC.x86_64 unixODBC-devel.i686 unixODBC-devel.x86_64


