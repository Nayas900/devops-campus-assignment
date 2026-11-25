
#!/bin/bash

# ==========================================
# System Information Monitoring Script
# Assignment 1 - DevOps Campus Recruitment
# ==========================================

# Generate today's date
REPORT_DATE=$(date "+%Y-%m-%d")

# Define output directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="$PROJECT_DIR/output"

# Create output directory if it does not exist
mkdir -p "$OUTPUT_DIR"

# Define report filename
OUTPUT_FILE="$OUTPUT_DIR/sysinfo_$REPORT_DATE.txt"

# Function to generate system information report
generate_report() {

    echo "=========================================="
    echo "       SYSTEM INFORMATION REPORT"
    echo "=========================================="

    echo ""
    echo "Hostname       : $(hostname)"
    echo "Date & Time    : $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Logged-in User : $(whoami)"

    echo ""
    echo "=========================================="
    echo "              DISK USAGE"
    echo "=========================================="

    df -h /

    echo ""
    echo "=========================================="
    echo "             MEMORY USAGE"
    echo "=========================================="

    free -h

    echo ""
    echo "=========================================="
    echo "     TOP 5 PROCESSES BY MEMORY USAGE"
    echo "=========================================="

    ps aux --sort=-%mem | head -n 6

    echo ""
    echo "=========================================="
    echo "          END OF REPORT"
    echo "=========================================="
}

# Display report in terminal and save it to a file
generate_report | tee "$OUTPUT_FILE"

echo ""
echo "Report successfully saved to: $OUTPUT_FILE"
