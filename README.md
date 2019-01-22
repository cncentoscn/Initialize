# Initialize
centos7以上系统初始化：selinux ntp firewall配置等

# 主要做了一些如下操作

- 关闭selinux
- yum基础插件 vim  gcc  openssl gcc-c++ epel-release  chrony zip unzip  lrzsz  openssl-devel
- 字符集UTF8   zh_CN.UTF-8
- firewall增加80 22 3306 443 端口
- 更换源为阿里云yum源
- 增加回收站找回，屏蔽了危险操作rm -rf ,想删除只能使用rm +文件名称
# 安装方法

yum install -y wget git

- 进入如下目录

cd /opt
git clone https://github.com/cncentoscn/Initialize.git

- 安装
cd Initialize/
./www.centoscn.vip.sh 

- 看到如下提示说明安装成功

success
success
success
success
success

- 执如下命令行使其生效
source ~/.bashrc

- 测试-随便找个文件删掉
rm anaconda-ks.cfg

- 想还原，在如下目录找,所有被删文件都在这个目录下。
[root@nginx-1 ~]# ll /root/.trash 
总用量 4
-rw-------. 1 root root 1487 1月  16 01:05 anaconda-ks.cfg

-具体还原方法，比如把这个文件还原到root目录下
[root@nginx-1 ~]# mv /root/.trash/anaconda-ks.cfg /root/
[root@nginx-1 ~]# ll
总用量 4
-rw-------. 1 root root 1487 1月  16 01:05 anaconda-ks.cfg
[root@nginx-1 ~]# cat anaconda-ks.cfg 
#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
# Use CDROM installation media
