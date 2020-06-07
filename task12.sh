#!/bin/bash


#Checking each log file within /var/log directory to check word systemd
for file in /var/log/*.log;
do
    fname="$(basename "$file")"
    count=`cat $file | grep -i systemd | wc -w`
    if [ $count -gt 0 ];then
       echo "-------------------------------"
       echo "FILENAME: $fname"
       echo "systemd WORD COUNT: $count"
       echo "-------------------------------"
    fi
done


