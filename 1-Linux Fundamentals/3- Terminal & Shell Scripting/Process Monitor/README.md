# Process Monitor

## Overview

The **Process Monitor** is a Bash script designed to help users view, manage, and analyze running processes on a Unix-like system. It provides an interactive mode with various functionalities, including real-time monitoring, process management, resource usage alerts, and more.

## Features

1. **List Running Processes**:
   - Lists all running processes with essential information such as PID, process name, and CPU/Memory usage.

2. **Process Information**:
   - Displays detailed information about a specific process, including PID, parent process ID, user, CPU and memory usage.

3. **Kill a Process**:
   - Allows users to terminate a specific process by entering its PID.

4. **Process Statistics**:
   - Shows overall system process statistics, including the total number of processes, memory usage, and CPU load.

5. **Real-time Monitoring**:
   - Updates the display at regular intervals to show the latest process information.

6. **Search and Filter**:
   - Enables users to search for processes based on criteria such as name, user, or resource usage.

7. **Interactive Mode**:
   - Provides an interactive mode where users can choose operations from a menu.

8. **Resource Usage Alerts**:
   - Sets up alerts for processes exceeding predefined resource usage thresholds.

9. **Logging**:
   - Records process-related activities, especially when a process is terminated.

10. **Configuration Options**:
    - Allows users to configure the script through a configuration file.

## Prerequisites

- A Unix-like operating system with Bash shell.
- Basic knowledge of command-line usage.

## Usage

### 1. Clone the Repository
```
git clone https://github.com/your-username/process-monitor.git
cd process-monitor
```

### 2. Make the Script Executable
```
chmod +x process_monitor.sh
```

## 3. Create a Configuration File

Create a `process_monitor.conf` file with the following content to specify settings:

```
# Sample configuration file for Process Monitor

# Update interval in seconds
UPDATE_INTERVAL=5

# CPU usage threshold for alerts (percentage)
CPU_ALERT_THRESHOLD=90

# Memory usage threshold for alerts (percentage)
MEMORY_ALERT_THRESHOLD=80
```

### 4. Run the Script

Run the script in interactive mode:

```
./process_monitor.sh
```


### 5. Features in Action
+ Listing Processes
To list all running processes with their details:
```
./process_monitor.sh list
```

+ Viewing Process Information
To get detailed information about a specific process:

```
./process_monitor.sh info <PID>
```

+ Killing a Process
To terminate a process by its PID:
```
./process_monitor.sh kill <PID>
```

+ Real-time Monitoring
To start real-time monitoring:
```
./process_monitor.sh monitor
```

### 6. Interactive Mode
In interactive mode, you will be presented with a menu of options to choose from, making it easier to perform various tasks without needing to remember specific commands.

### 7. Logs
Process activities, especially terminations, are logged for later review. Logs can be found in the `logs/` directory.

