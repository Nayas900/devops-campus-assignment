
#!/bin/bash

# ==========================================
# Web Server Log Analysis Script
# Assignment 1 - DevOps Campus Recruitment
# ==========================================

# Exit if an error occurs in a pipeline
set -o pipefail

# Check whether the log file argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <log_file>"
    echo "Example: $0 ../sample-logs/access.log"
    exit 1
fi

# Store the input log file path
LOG_FILE="$1"

# Check whether the file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File does not exist: $LOG_FILE"
    exit 1
fi

# Check whether the file is readable
if [ ! -r "$LOG_FILE" ]; then
    echo "Error: File is not readable: $LOG_FILE"
    exit 1
fi

# Count valid access-log records
TOTAL_REQUESTS=$(awk 'NF >= 9 { count++ } END { print count+0 }' "$LOG_FILE")

# Count HTTP 404 errors
ERROR_404=$(awk 'NF >= 9 && $9 == "404" { count++ } END { print count+0 }' "$LOG_FILE")

# Display the report
echo "=========================================="
echo "        WEB SERVER LOG REPORT"
echo "=========================================="

echo ""
echo "Log File       : $LOG_FILE"
echo "Total Requests : $TOTAL_REQUESTS"
echo "404 Errors     : $ERROR_404"

echo ""
echo "=========================================="
echo "          TOP 3 IP ADDRESSES"
echo "=========================================="

awk 'NF >= 9 { count[$1]++ }
     END {
         for (ip in count) {
             print count[ip], ip
         }
     }' "$LOG_FILE" |
sort -k1,1nr -k2,2 |
head -n 3

echo ""
echo "=========================================="
echo "          END OF REPORT"
echo "=========================================="
