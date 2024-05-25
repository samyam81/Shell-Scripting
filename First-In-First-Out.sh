#!/bin/bash

# Define the Process structure
declare -A Process

# Function to initialize a Process
initialize_process() {
    Process[$1]="pid:$2,AT:$3,BT:$4"
}

# Function to execute FIFO algorithm
FIFO() {
    local processes=("$@")
    local TWT=0
    local TAT=0

    for process in "${processes[@]}"; do
        local pid=$(echo "$process" | cut -d',' -f1 | cut -d':' -f2)
        local AT=$(echo "$process" | cut -d',' -f2 | cut -d':' -f2)
        local BT=$(echo "$process" | cut -d',' -f3 | cut -d':' -f2)

        if [ "${#queue[@]}" -ne 0 ]; then
            TAT=$((TAT + ${queue[0]##*,BT:}))
        fi

        queue+=("$process")
        echo "Process $pid is being executed."
        TWT=$((TWT + TAT - AT))
        unset queue[0]
    done

    local avgWT=$(awk "BEGIN {print $TWT / ${#processes[@]}}")
    local avgTAT=$(awk "BEGIN {print $TAT / ${#processes[@]}}")

    echo "Average Waiting Time: $avgWT"
    echo "Average Turnaround Time: $avgTAT"
}

# Main function
main() {
    initialize_process 1 0 3
    initialize_process 2 2 5
    initialize_process 3 4 2

    FIFO "${Process[@]}"
}

main
