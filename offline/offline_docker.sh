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
   sudo docker --version
   sudo docker-compose --version 
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

