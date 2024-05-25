#!/bin/bash

# Function to collect and log system resource data
monitor_resources() {
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    memory_usage=$(free | awk '/Mem/{printf "%.2f", $3/$2*100}')
    disk_usage=$(df -h | awk '$NF=="/"{print $5}' | sed 's/%//')
    network_usage=$(iftop -t -s 5 | grep "Total send and receive rate:" | awk '{print $5}')
    
    echo "$timestamp - CPU Usage: $cpu_usage% | Memory Usage: $memory_usage% | Disk Usage: $disk_usage% | Network Usage: $network_usage" >> resource_monitor.log
}

# Monitor resources every 5 minutes (adjust interval as needed)
while true; do
    monitor_resources
    sleep 300  # 5 minutes
done
