#!/bin/bash

# Get the current date and time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Get the memory usage using the free command, showing the percentage of used memory
MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0"%"}')

# Log the memory usage to a file
echo "$DATE - Memory Usage: $MEMORY_USAGE" >> ~/system_monitoring/memory_usage.log

