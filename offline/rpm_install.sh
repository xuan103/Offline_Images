#!/bin/bash

### prepare ###
if [ ! -f $home/offline/tar ]; then
   mkdir -p $home/offline/tar
else
   echo "Hey, $home/offline/tar exist." 
fi

if [ ! -f $home/offline/rpm ]; then
   mkdir -p $home/offline/rpm
else
   echo "Hey, $home/offline/rpm exist." 
fi

### Docker ###
docker_download=https://download.docker.com/linux/centos/7/x86_64/stable/Packages/
docker_containerd=containerd.io-1.4.4-3.1.el7.x86_64.rpm
docker_docker_ce=docker-ce-20.10.5-3.el7.x86_64.rpm
docker_container=container-selinux-2.119.2-1.911c772.el7_8.noarch.rpm
docker_docker_ce_cli=docker-ce-cli-20.10.5-3.el7.x86_64.rpm

### Nginx ###
nginx_rpm=nginx-1.18.0-2.el7.ngx.x86_64.rpm

### dotnet ###
dotnet_targz=dotnet-sdk-3.1.407-linux-x64.tar.gz

## containerd.io-1.4.4-3.1.el7.x86_64.rpm
if [ ! -f $docker_containerd ]; then
   echo "Oops, $docker_containerd not find" 
   wget "$docker_download""$docker_containerd" &>/dev/null
else
   echo "Hey, $docker_containerd exist." 
fi

## docker-ce-20.10.5-3.el7.x86_64.rpm
if [ ! -f $docker_docker_ce ]; then
   echo "Oops, $docker_docker_ce not find"
   wget "$docker_download""$docker_docker_ce" &>/dev/null 
else
   echo "Hey, "$docker_docker_ce" exist."
fi

## container-selinux-2.119.2-1.911c772.el7_8.noarch.rpm
if [ ! -f $docker_container ]; then
   echo "Oops, $docker_container not find" 
   wget http://ftp.riken.jp/Linux/cern/centos/7/extras/x86_64/Packages/$docker_container &>/dev/null
else
   echo "Hey, $docker_container exist."
fi

## docker-ce-cli-20.10.5-3.el7.x86_64.rpm
if [ ! -f $docker_docker_ce_cl ]; then
   echo "Oops, $docker_docker_ce_cl not find" 
   wget "$docker_download""$docker_docker_ce_cli" &>/dev/null
else
   echo "Hey, $docker_download exist."
fi

### Image ### 
## CentOS_7.tar
if [ ! -f CentOS_7.tar ]; then
   echo "Oops, CentOS_7.tar not find" 
else
   docker pull centos:7 
   docker save centos > CentOS_7.tar
fi

## hello_world.tar
if [ ! -f hello_world.tar ]; then
   echo "Oops, hello_world.tar not find" 
else
   docker pull hello_world 
   docker save hello_world > hello_world.tar
fi

### Nginx ###
## nginx-1.18.0-2.el7.ngx.x86_64.rpm
if [ ! -f $nginx_rpm ]; then
   echo "Oops, $nginx_rpm not find" 
   wget http://nginx.org/packages/centos/7/x86_64/RPMS/$nginx_rpm
else
   echo "Hey, $nginx_rpm exist."
fi

### dotnet ###
## dotnet-sdk-3.1.407-linux-x64.tar.gz
if [ ! -f $dotnet_targz ]; then
   echo "Oops, $dotnet_targz not find" 
   wget https://dotnetcli.azureedge.net/dotnet/Sdk/3.1.407/$dotnet_targz
else
   echo "Hey, $dotnet_targz exist."
fi




