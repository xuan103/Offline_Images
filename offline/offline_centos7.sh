#!/bin/bash

if [ ! -f CentOS_7.tar ]; then 
   echo "Oops, CentOS_7.tar not find." && exit 1
else
   echo "Start pull CentOS:7 Image..."
   sudo docker load < CentOS_7.tar &>/dev/null
   [ "$?" == "0" ] && echo "Yeah, CentOS:7 Image Already." 
fi
