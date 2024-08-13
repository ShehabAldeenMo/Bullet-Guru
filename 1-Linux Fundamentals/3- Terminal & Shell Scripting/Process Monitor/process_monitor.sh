#!/usr/bin/bash -i

# Load configuration file
source process_monitor.conf

# Create a log directory if it doesn't exist
mkdir -p logs

# Function to list all running processes
list_processes() {
    echo "Listing all running processes..."
    ps aux
}

# Function to display detailed information about a process
process_info() {
    if [ -z "$1" ]; then
        echo "Usage: $0 info <PID>"
        return 1
    fi
    echo "Detailed information for process $1:"
    ps -p "$1" -o pid,ppid,user,%cpu,%mem,command
}

# Function to kill a process by PID
kill_process() {
    if [ -z "$1" ]; then
        echo "Usage: $0 kill <PID>"
        return 1
    fi
    echo "Killing process $1..."
    kill "$1" && echo "Process $1 terminated." | tee -a logs/process_monitor.log
}

# Function to display process statistics
process_stats() {
    echo "Process statistics:"
    ps aux --sort=-%mem | awk 'NR<=10{print $0}'
    echo "Total number of processes: $(ps aux | wc -l)"
}

# Function for real-time monitoring
monitor_processes() {
    echo "Starting real-time monitoring (Press Ctrl+C to stop)..."
    while true; do
        clear
        ps aux --sort=-%cpu | head -n 10
        sleep "$UPDATE_INTERVAL"
    done
}

# Function to search for processes based on criteria
search_processes() {
    if [ -z "$1" ]; then
        echo "Usage: $0 search <criteria>"
        return 1
    fi
    echo "Searching for processes matching '$1'..."
    ps aux | grep -i "$1" | grep -v grep
}

# Function for interactive mode
interactive_mode() {
    while true; do
        echo "Process Monitor - Interactive Mode"
        echo "1. List Running Processes"
        echo "2. Process Information"
        echo "3. Kill a Process"
        echo "4. Process Statistics"
        echo "5. Real-time Monitoring"
        echo "6. Search and Filter"
        echo "7. Exit"
        read -p "Choose an option: " choice

        case $choice in
            1) list_processes ;;
            2) read -p "Enter PID: " pid
               process_info "$pid" ;;
            3) read -p "Enter PID: " pid
               kill_process "$pid" ;;
            4) process_stats ;;
            5) monitor_processes ;;
            6) read -p "Enter search criteria: " criteria
               search_processes "$criteria" ;;
            7) exit 0 ;;
            *) echo "Invalid option. Please try again." ;;
        esac
    done
}

# Main script execution
if [ "$1" == "list" ]; then
    list_processes
elif [ "$1" == "info" ]; then
    process_info "$2"
elif [ "$1" == "kill" ]; then
    kill_process "$2"
elif [ "$1" == "stats" ]; then
    process_stats
elif [ "$1" == "monitor" ]; then
    monitor_processes
elif [ "$1" == "search" ]; then
    search_processes "$2"
else
    interactive_mode
fi
