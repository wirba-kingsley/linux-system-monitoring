#!/bin/bash

# Get the current date and time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Get the network interface statistics using ifstat
RX=$(ifstat -i eth0 1 1 | awk 'NR==3 {print $1}')
TX=$(ifstat -i eth0 1 1 | awk 'NR==3 {print $2}')

# Log the network activity to a file
echo "$DATE - Network In: $RX KB/s, Network Out: $TX KB/s" >> ~/system_monitoring/network_activity.log

