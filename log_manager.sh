#!/bin/bash

# Define variables
LOG_DIR="audit_logs"
PREFIX="security_audit"

echo "[*] Initializing Log Manager..."

# 1. Check and create directory
if [ ! -d "$LOG_DIR" ]; then
    mkdir "$LOG_DIR"
    echo "[+] Created directory: $LOG_DIR"
else
    echo "[*] Directory $LOG_DIR already exists."
fi

# 2. Generate 5 timestamped mock log files using a loop
for i in {1..5}
do
    filename="$LOG_DIR/${PREFIX}_${i}.log"
    echo "[INFO] Mock security scan executed at $(date)" > "$filename"
    echo "[+] Generated: $filename"
done

# 3. Validation check
echo "[*] Verifying file generation..."
file_count=$(ls -1 "$LOG_DIR" | wc -l)
if [ "$file_count" -ge 5 ]; then
    echo "[SUCCESS] Verification passed: $file_count files present in $LOG_DIR."
else
    echo "[-] Warning: Expected at least 5 files, found $file_count."
fi

# 4. Interactive cleanup choice
read -p "[?] Do you want to clean up (delete) these generated logs? (y/n): " choice
if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
    rm -rf "$LOG_DIR"
    echo "[-] Cleanup complete: $LOG_DIR removed."
else
    echo "[*] Files preserved in $LOG_DIR."
fi
