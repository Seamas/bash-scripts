#!/bin/sh

#关闭并禁用防火墙
echo "systemctl stop firewalld.service"
systemctl stop firewalld.service
echo "systemctl disable filewalld.service"
systemctl disable firewalld.service

#关闭selinux
echo "sed -i 关闭selinux"
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

#修改内核参数
echo "修改内核参数"
echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.conf
echo "fs.file-max = 6815744 #设置最大打开文件数" >> /etc/sysctl.conf
echo "fs.aio-max-nr = 1048576" >> /etc/sysctl.conf
echo "kernel.shmall = 2097152 #共享内存的总量，8G内存设置：2097152*4k/1024/1024">> /etc/sysctl.conf
echo "kernel.shmmax = 2147483648 #最大共享内存的段大小" >> /etc/sysctl.conf
echo "kernel.shmmni = 4096 #整个系统共享内存端的最大数" >> /etc/sysctl.conf
echo "kernel.sem = 250 32000 100 128" >> /etc/sysctl.conf
echo "net.ipv4.ip_local_port_range = 9000 65500 #可使用的IPv4端口范围" >> /etc/sysctl.conf
echo "net.core.rmem_default = 262144" >> /etc/sysctl.conf
echo "net.core.rmem_max= 4194304" >> /etc/sysctl.conf
echo "net.core.wmem_default= 262144" >> /etc/sysctl.conf
echo "net.core.wmem_max= 1048576" >> /etc/sysctl.conf

#使内核参数生效
echo "sysctl -p"
sysctl -p


#修改/etc/security/limits.conf,提高软件性能
echo "修改/etc/security/limits.conf,提高性能"
echo "oracle soft nproc 2047" >> /etc/security/limits.conf
echo "oracle hard nproc 16384" >> /etc/security/limits.conf
echo "oracle soft nofile 1024" >> /etc/security/limits.conf
echo "oracle hard nofile 65536" >> /etc/security/limits.conf

#修改配置文件
echo "修改/home/oracle/.bash_profile增加环境变量"
echo "export ORACLE_BASE=/data/oracle" >> /home/oracle/.bash_profile
echo "export ORACLE_HOME=\$ORACLE_BASE/product/11.2.0/db_1" >> /home/oracle/.bash_profile
echo "export ORACLE_SID=orcl" >> /home/oracle/.bash_profile
echo "export ORACLE_TERM=xterm" >> /home/oracle/.bash_profile
echo "export PATH=\$ORACLE_HOME/bin:/usr/sbin:$PATH" >> /home/oracle/.bash_profile
echo "export LD_LIBRARY_PATH=\$ORACLE_HOME/lib:/lib:/usr/lib" >> /home/oracle/.bash_profile
echo "export LANG=C" >> /home/oracle/.bash_profile
echo "export NLS_LANG=AMERICAN_AMERICA.ZHS16GBK" >> /home/oracle/.bash_profile