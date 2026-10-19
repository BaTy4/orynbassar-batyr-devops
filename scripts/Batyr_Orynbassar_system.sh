#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "=============================="
echo "Student Information"
echo "=============================="
cat "$PROJECT_DIR/Batyr_Orynbassar_info.txt"

echo
echo "=============================="
echo "System Information"
echo "=============================="

echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -s)"
echo "Disk Usage:"
df -h /
echo "Memory Usage:"
free -h

if [ -f "$PROJECT_DIR/Batyr_Orynbassar_info.txt" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
