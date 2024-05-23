#!/bin/bash

echo "Start The Day."
# File containing links
links_file="links.txt"

# Check if Chrome is installed
if ! command -v google-chrome &> /dev/null; then
    echo "Chrome is not installed."
    exit 1
fi

# Check if the links file exists
if [ ! -f "$links_file" ]; then
    echo "Links file not found: $links_file"
    exit 1
fi

# Read each line from the file and open in Chrome
while IFS= read -r line; do
    # Extracting URL from the line
    url=$(echo "$line" | awk '{print $1}')

    # Open the URL in Chrome
    google-chrome "$url" &
done < "$links_file"
