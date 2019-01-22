#!/bin/bash
# coding: utf-8
# Copyright (c) 2019
# Gmail: lucky@centoscn.vip
# blog:www.centoscn.vip

set -e

#yum源"
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

echo "安装基本依赖"
{
yum install wget vim  gcc  openssl gcc-c++ epel-release  chrony zip unzip  lrzsz  openssl-devel  -y
} || {
echo "yum出错，请更换源重新运行"
exit 1
}
##ntp
sed -i "/server/d" /etc/chrony.conf
echo "server ntp.aliyun.com iburst" >> /etc/chrony.conf
systemctl restart chronyd
##修改字符集
localedef -c -f UTF-8 -i zh_CN zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
echo 'LANG=zh_CN.UTF-8' > /etc/locale.conf
#关闭selinux增加firewall端口
sed -i "s/enforcing/disabled/g" /etc/selinux/config
setenforce 0
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=22/tcp --permanent
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --reload
#回收站
rm -rf  /root/.bashrc
mv /opt/Initialize/.bashrc  /root/
mkdir -p /root/.trash
cd /root
source .bashrc
