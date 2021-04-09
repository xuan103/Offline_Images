FROM centos:7

RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install nginx

# Install dotnet 3.1
RUN rpm -Uvh \
https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm 
RUN yum -y install dotnet-sdk-3.1

ADD index.html /usr/share/nginx/html/index.html

EXPOSE 80/tcp
CMD ["nginx", "-g daemon off;"]

