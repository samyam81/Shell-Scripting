#!/bin/bash

# Function to check website status
check_website() {
    website=$1
    status_code=$(curl -Is --connect-timeout 5 "$website" | head -n 1 | cut -d' ' -f2)
    if [ "$status_code" == "200" ]; then
        echo "$(date +"%Y-%m-%d %H:%M:%S") - $website is UP (Status Code: $status_code)" >> website_monitor.log
    else
        echo "$(date +"%Y-%m-%d %H:%M:%S") - $website is DOWN (Status Code: $status_code)" >> website_monitor.log
        # Add notification logic here (e.g., sending email alerts)
    fi
}

# List of websites to monitor
websites=("https://example.com" "https://google.com" "https://github.com")

# Monitor websites every 5 minutes (adjust interval as needed)
while true; do
    for site in "${websites[@]}"; do
        check_website "$site"
    done
    sleep 300  # 5 minutes
done
