#!/bin/bash

if [[ "$#" -lt 1 ]]; then
	echo "You have entered incorrect number of arguments"
	echo "The correct format is:"
	echo "$0 <Interface IP of Core Network>"
	echo "Eg. $0 172.16.0.1"
	sleep 5;
	exit 1;
else

packet_size=('100' '500' '1400' '5000')

for i in ${packet_size[@]}; do
	echo "Packet Size $i"
	for j in $(seq 1 3);do
	echo "#############################"
	echo "Iteration Number $j for Packet Size $i"
		timeout 60s ping -f -s $i $1
 	done
	echo "#############################"
	sleep 5;
done
fi
