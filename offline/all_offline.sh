#!/bin/bash

which docker &>/dev/null
if [ "$?" == "0" ]; then 
   echo "Oops, Already Installed Docker." && exit 1
else
   echo "Docker installing..."
   sudo rpm -ivh \
   containerd.io-1.4.4-3.1.el7.x86_64.rpm \
   docker-ce-20.10.5-3.el7.x86_64.rpm \
   container-selinux-2.119.2-1.911c772.el7_8.noarch.rpm \
   docker-ce-cli-20.10.5-3.el7.x86_64.rpm \
   --force --nodeps &>/dev/null
   sudo systemctl start docker &>/dev/null
   sudo docker load < hello_world.tar &>/dev/null
   sudo docker run hello-world &>/dev/null
   sudo mv docker-compose-Linux-x86_64 /usr/local/bin/docker-compose 
   sudo chmod +x /usr/local/bin/docker-compose
   sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
fi

which docker &>/dev/null
if [ "$?" == "0" ]; then 
   echo "Yeah, Docker-offline: Installation finished successfully" 
   sudo docker --version
else
   echo "Oops, Installation Docker ERROR."
fi

which docker-compose &>/dev/null
if [ "$?" == "0" ]; then 
   echo "Yeah, docker-compose-offline: Installation finished successfully"
   sudo docker-compose --version 
else
   echo "Oops, Installation docker-compose ERROR."
fi

if [ ! -f CentOS_7.tar ]; then 
   echo "Oops, CentOS_7.tar not find." && exit 1
else
   echo "Start pull CentOS:7 Image."
   sudo docker load < CentOS_7.tar &>/dev/null
   [ "$?" == "0" ] && echo "Yeah, CentOS:7 Image Already." 
fi

which ndinx &>/dev/null
if [ "$?" == "0" ]; then 
   echo "Oops, Already Installed Nginx." && exit 1
else
echo "Ndinx installing..."
   sudo rpm -ivh \
   nginx-1.18.0-2.el7.ngx.x86_64.rpm \
   --force --nodeps &>/dev/null
   sudo systemctl start nginx.service &>/dev/null
   sudo systemctl enable nginx.service &>/dev/null
fi

which nginx &>/dev/null 
if [ "$?" == "0" ]; then 
   echo "Yeah, Nginx-offline: Installation finished successfully."
   nginx -v
else
   echo "Oops, Installation Nginx ERROR."
fi

which dotnet &>/dev/null
if [ "$?" == "0" ] ; then
   echo "Oops, Already Installed dotnet." && exit 1
else
   echo "DotNet installing..."
   DOTNET_FILE=dotnet-sdk-3.1.407-linux-x64.tar.gz
   export DOTNET_ROOT=$HOME/dotnet
   mkdir -p "$DOTNET_ROOT" && tar zxf "$DOTNET_FILE" -C "$DOTNET_ROOT" &>/dev/null
   export PATH=$PATH:$DOTNET_ROOT
   dotnet new console --output sample1 &>/dev/null
   dotnet run --project sample1 
fi

which dotnet &>/dev/null
if [ "$?" == "0" ]; then 
   echo "Yeah, dotnet-offline: Installation finished successfully."
else
   echo "Oops, Installation dotnet ERROR."
fi 

