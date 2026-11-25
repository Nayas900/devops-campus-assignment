# Assignment 1: Linux Shell Scripting and Git

## 1. Objective

The objective of this assignment is to demonstrate practical knowledge of Linux command-line operations, Bash shell scripting, system monitoring, log analysis, and Git-based version control.

Two Bash scripts have been developed:

- **sysinfo.sh:** Collects and displays essential Linux system information, including hostname, date and time, logged-in user, disk usage, memory usage, and top 5 processes by memory consumption.
- **log_report.sh:** Analyzes a web server access log file to calculate total requests, count HTTP 404 errors, and identify the top 3 IP addresses.

Additional features include date-based system reports, input validation, and automated execution using cron.

## 2. Technologies and Tools Used

| Technology | Purpose |
|---|---|
| Ubuntu 24.04 (WSL2) | Linux development environment |
| Bash | Shell scripting |
| Linux utilities | System monitoring and log analysis |
| AWK | Log parsing and data extraction |
| sort and uniq | Sorting and frequency analysis |
| Git | Version control |
| GitHub | Source code hosting |
| Docker | Containerization and container management |

## 3. Project Structure

```text
assignment-1-linux-scripting/
│
├── scripts/
│   ├── sysinfo.sh
│   └── log_report.sh
│
├── sample-logs/
│   └── access.log
│
├── output/
│   └── sysinfo_YYYY-MM-DD.txt
│
└── README.md
```

## 4. Environment Setup and Verification

The project was developed and tested using Ubuntu 24.04 running through Windows Subsystem for Linux (WSL2).

The following tools were verified:

- Ubuntu terminal and Linux command execution.
- Git installation and global user configuration.
- Docker installation and Linux container engine connectivity.
- Successful execution of a test Docker container using the `hello-world` image.

## 5. Task 1: System Information Script (`sysinfo.sh`)

### Objective

Create a Bash script that collects important Linux system information and displays it in the terminal. The script also saves the generated report in a date-named text file.

### Information Collected

The script displays:

- **Hostname:** Uses `hostname` to display the system's hostname.
- **Date and time:** Uses `date` to display the current date and time.
- **Logged-in user:** Uses `whoami` to display the current user.
- **Disk usage:** Uses `df -h /` to display disk usage of the root filesystem in human-readable format.
- **Memory usage:** Uses `free -h` to display RAM and swap usage.
- **Top 5 processes:** Uses `ps aux --sort=-%mem | head -n 6` to display the five processes consuming the most memory. The first line is the column header.

### Implementation

**Script location:** `scripts/sysinfo.sh`

The script uses a Bash function to generate the system information report.

It uses:

- Command substitution to capture system command output.
- `mkdir -p` to create the output directory if it does not exist.
- `ps aux --sort=-%mem` to sort processes by memory consumption.
- `head -n 6` to display the header and top five processes.
- `tee` to display the report in the terminal and save the same output to a file.

The report is automatically saved in the `output/` directory with the current date in its filename.

**Example output filename:**

```text
output/sysinfo_2026-11-24.txt
```

### How to Execute

From the Assignment 1 directory:

```bash
cd scripts
chmod +x sysinfo.sh
./sysinfo.sh
```

To view the generated report:

```bash
cat ../output/sysinfo_$(date +%Y-%m-%d).txt
```

### Testing and Verification

The script was executed successfully in Ubuntu on WSL2.

The following checks were verified:

- System hostname and logged-in username were displayed correctly.
- Current date and time were displayed.
- Root filesystem disk usage was displayed.
- RAM and swap usage were displayed.
- Exactly five processes were listed below the process table header.
- The report was successfully saved in the `output/` directory.

**Status:** Completed and tested successfully.

### Bonus Implemented

- The script automatically creates the `output/` directory if it does not exist.
- The report is saved using the current date in its filename.
- `tee` displays the report on the terminal while saving it to a file.

## 6. Task 2: Web Server Log Analysis (`log_report.sh`)

### Objective

Create a Bash script that accepts a web server access log file as a command-line argument and generates a summary report.

### Information Extracted

The script calculates:

1. Total number of requests.
2. Number of HTTP 404 errors.
3. Top 3 IP addresses based on request frequency.

### Implementation

**Script location:** `scripts/log_report.sh`

The script uses:

- `$#` to validate the number of command-line arguments.
- `$1` to access the supplied log file path.
- `-f` to check whether the supplied path is a regular file.
- `-r` to check whether the file is readable.
- `awk` to extract IP addresses and HTTP status codes.
- Associative arrays in AWK to count requests from each IP address.
- `sort` to arrange IP addresses by request frequency.
- `head -n 3` to display the top three IP addresses.

The script also handles missing arguments and invalid file paths with appropriate error messages.

### How to Execute

From the Assignment 1 directory:

```bash
cd scripts
chmod +x log_report.sh
./log_report.sh ../sample-logs/access.log
```

### Sample Input

The sample access log is available at:

```text
sample-logs/access.log
```

It contains 10 Apache-style access log entries with different IP addresses and HTTP status codes.

### Expected Output

```text
==========================================
        WEB SERVER LOG REPORT
==========================================

Log File       : ../sample-logs/access.log
Total Requests : 10
404 Errors     : 3

==========================================
          TOP 3 IP ADDRESSES
==========================================
4 192.168.1.10
3 192.168.1.20
2 192.168.1.30

==========================================
          END OF REPORT
==========================================
```

### Testing and Verification

The script was successfully tested with the following scenarios:

| Test Case | Expected Result | Status |
|---|---|---|
| Valid access log file | Correct request and error counts | Passed |
| Top IP addresses | Correct top 3 IP addresses | Passed |
| Missing argument | Display usage instructions | Passed |
| Non-existent file | Display file-not-found error | Passed |

**Status:** Completed and tested successfully.

### Bonus Implemented

- Displays usage instructions when the required log file argument is missing.
- Validates whether the supplied file exists.
- Checks whether the supplied file is readable.

## 7. Execution Instructions

Both scripts can be executed from the `scripts/` directory.

### Run System Information Script

```bash
cd scripts
./sysinfo.sh
```

### Run Log Analysis Script

```bash
./log_report.sh ../sample-logs/access.log
```

## 8. Bonus Features

The following bonus features have been implemented:

- Display usage instructions when the required log file argument is missing.
- Validate log file existence and readability.
- Save system information reports using today's date in the filename.
- Automatically create the output directory if it does not exist.

**Pending:** Hourly automatic execution of the system information script using cron.

## 9. Testing and Validation

Both Bash scripts have been executed successfully in Ubuntu on WSL2.

Testing includes:

- System information collection and report generation.
- Disk and memory usage monitoring.
- Top five process identification.
- Log file parsing and request counting.
- HTTP 404 error detection.
- Top three IP address identification.
- Invalid argument and missing file handling.

## 10. Key Learnings

This assignment demonstrates practical understanding of:

- Linux command-line operations.
- Bash scripting and command substitution.
- Linux process, disk, and memory monitoring.
- File permissions and executable scripts.
- AWK for log parsing and data processing.
- Sorting and frequency counting.
- Input validation and error handling.
- Cron scheduling.
- Git and GitHub version control.
:::
