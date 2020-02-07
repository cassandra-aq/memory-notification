#!/bin/bash 
#######################################################################################
#Script Name   : alertmemory.sh
#Description   : send alert notification when memory is running low
#Args          :       
#Author        : Cassandra Anquetil
#Email         : cassandra.anquetil@gmail.com
#License       : Apache License 2.0
#######################################################################################

# Minimum free memory limit (MB)
THRESHOLD=1000

# Check time interval (sec)
INTERVAL=30

ICON=/usr/share/icons/gnome/32x32/emblems/emblem-important.png


while :
do
	# get total free memory size (MB) 
	free=$(free -mt | grep Total | awk '{print $4}')
	
	# check if free memory is less or equals to threshold
	if [ "$free" -le $THRESHOLD  ]
		then
		notify-send -u critical -i $ICON "Attention : presque plus de mémoire !"
	fi
	sleep $INTERVAL
done

exit 0
