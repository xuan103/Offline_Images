#!/bin/bash

### prepare index.html ###
if [ ! -f $home/offline/ ]; then
   echo "<header>
<h1>Docker ADD is neat</h1>
</header>" > index.html 
fi

### prepare Dockerfile ###
if [ ! -f $home/offline/Dockerfile ]; then
   echo "FROM centos:7

RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install nginx

# Install dotnet 3.1
RUN rpm -Uvh \
https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm 
RUN yum -y install dotnet-sdk-3.1

ADD index.html /usr/share/nginx/html/index.html

EXPOSE 80/tcp
CMD ["nginx", "-g daemon off;"]"> Dockerfile
else
   echo "start docker build."
   sudo docker build -t centos_tools . --no-cache
fi


## If want to check images:
#sudo docker images

## If want to run docker:
#sudo docker run --name t1 -d centos_tools

## If want docker to working to do:
#sudo docker exec -it t1 /bin/bash

## If want to save docker to ".tar":
#sudo docker save centos_tool > centos_tool.tar


