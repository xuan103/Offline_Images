#!/bin/bash

which ndinx &>/dev/null
if [ "$?" == "0" ]; then 
   echo "Oops, Already Installed Nginx." && exit 1
else
echo "Nginx installing..."
   sudo rpm -ivh \
   nginx-1.18.0-2.el7.ngx.x86_64.rpm \
   --force --nodeps &>/dev/null
   sudo systemctl start nginx.service &>/dev/null
   sudo systemctl enable nginx.service &>/dev/null
   nginx -v
fi

which nginx &>/dev/null 
if [ "$?" == "0" ]; then 
   echo "Yeah, Nginx-offline: Installation finished successfully."
else
   echo "Oops, Installation Nginx ERROR."
fi
