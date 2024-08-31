#!/bin/bash

# Get the current date and time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Get the disk usage for the root partition
DISK_USAGE=$(df -h / | grep / | awk '{print $5}')

# Log the disk usage to a file
echo "$DATE - Disk Usage: $DISK_USAGE" >> ~/system_monitoring/disk_usage.log

