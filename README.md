Project Overview
This project consists of a series of Bash scripts designed to monitor key system metrics on a Linux machine. The metrics include CPU usage, memory usage, disk space, and network activity. These scripts are scheduled to run at regular intervals using cron jobs, and they log their output to specific log files.

Scripts
1. monitor_cpu.sh
Monitors CPU usage and logs the percentage of CPU used.

Script Details
Command Used: top
Output File: cpu_usage.log
Example Log Entry: 2024-08-31 12:00:00 - CPU Usage: 15.5%
Code
#!/bin/bash

# Get the current date and time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Get the CPU usage using the top command, filtered to show only the idle percentage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')

# Log the CPU usage to a file
echo "$DATE - CPU Usage: $CPU_USAGE" >> ~/system_monitoring/cpu_usage.log

2. monitor_memory.sh
Monitors memory usage and logs the percentage of memory used.

Script Details
Command Used: free
Output File: memory_usage.log
Example Log Entry: 2024-08-31 12:00:00 - Memory Usage: 63.4%
Code
#!/bin/bash

# Get the current date and time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Get the memory usage using the free command, showing the percentage of used memory
MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0"%"}')

# Log the memory usage to a file
echo "$DATE - Memory Usage: $MEMORY_USAGE" >> ~/system_monitoring/memory_usage.log
3. monitor_disk.sh
Monitors disk space usage and logs the percentage of disk space used on the root partition.

Script Details
Command Used: df
Output File: disk_usage.log

Example Log Entry: 2024-08-31 12:00:00 - Disk Usage: 45%
Code
#!/bin/bash

# Get the current date and time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Get the disk usage for the root partition
DISK_USAGE=$(df -h / | grep / | awk '{print $5}')

# Log the disk usage to a file
echo "$DATE - Disk Usage: $DISK_USAGE" >> ~/system_monitoring/disk_usage.log
4. monitor_network.sh
Monitors network activity and logs the inbound and outbound data rates.

Script Details
Command Used: ifstat
Output File: network_activity.log
Example Log Entry: 2024-08-31 12:00:00 - Network In: 12 KB/s, Network Out: 8 KB/s
Code
#!/bin/bash

# Get the current date and time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Get the network interface statistics using ifstat
RX=$(ifstat -i eth0 1 1 | awk 'NR==3 {print $1}')
TX=$(ifstat -i eth0 1 1 | awk 'NR==3 {print $2}')

# Log the network activity to a file
echo "$DATE - Network In: $RX KB/s, Network Out: $TX KB/s" >> ~/system_monitoring/network_activity.log

Setting Up Cron Jobs
To schedule these scripts to run at regular intervals, you need to set up cron jobs.
crontab -e*/10 * * * * ~/system_monitoring/monitor_cpu.sh
*/10 * * * * ~/system_monitoring/monitor_memory.sh
*/10 * * * * ~/system_monitoring/monitor_disk.sh
*/10 * * * * ~/system_monitoring/monitor_network.sh

