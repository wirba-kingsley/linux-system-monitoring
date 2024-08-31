#!/bin/bash

# Get the current date and time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Get the CPU usage using the top command, filtered to show only the idle percentage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')

# Log the CPU usage to a file
echo "$DATE - CPU Usage: $CPU_USAGE" >> ~/system_monitoring/cpu_usage.log

