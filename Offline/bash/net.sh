#!/bin/bash

while :
do

echo -e '
menu:
> 1. restart network ?
> 2. start network ?
> 3. stop network ?
> 4. status network ?
> e. exit?'

read -p "what do you want: " ans
case $ans in

1)
   sudo systemctl restart network.service
   #OR
   #sudo systemctl restart network
   break
   ;;
2)
   sudo systemctl start network.service
   #OR
   #sudo systemctl start network
   break
   ;;
3)
   sudo systemctl stop network.service
   #OR
   #sudo systemctl stop network
   break
   ;;
4)
   sudo systemctl status network.service
   #OR
   #sudo systemctl status network
   break
   ;;
e)
   exit
   ;;
*)
   echo "Please select"
esac
# echo "Thanks"
done
