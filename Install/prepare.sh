#!/bin/bash

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
   echo "Hey, "Dockerfile" exist." 
fi

### prepare index.html ###
if [ ! -f $home/offline/ ]; then
   echo "<header>
<h1>Docker ADD is neat</h1>
</header>" > index.html
else
   echo "Hey, "index.html" exist." 
fi


