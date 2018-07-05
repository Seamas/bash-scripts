#!/bin/sh

#创建用户组 oinstall 和 dba
echo "groupadd oinstall"
groupadd oinstall
echo "groupadd dba"
groupadd dba

#创建用户 oracle
echo "useradd -g oinstall -g dba -m oracle"
useradd -g oinstall -g dba -m oracle

#创建文件夹
echo "mkdir -p /data/oracle"
mkdir -p /data/oracle
echo "mkdir -p /data/oraInventory"
mkdir -p /data/oraInventory
echo "mkdir -p /data/database"
mkdir -p /data/database

#授权文件夹
echo "chown -R oracle:oinstall /data/oracle"
chown -R oracle:oinstall /data/oracle
echo "chown -R oracle:oinstall /data/oraInventory"
chown -R oracle:oinstall /data/oraInventory
echo "chown -R oracle:oinstall /data/database"
chown -R oracle:oinstall /data/database


#oracle官方不支持centos，修改centos的系统标识为redhat
echo "modify redhat-release"
echo "redhat-7" > /etc/redhat-release
