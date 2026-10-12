#!/bin/bash

# System Log Manager & Security Auditor
# Parses local authentication logs for security review and reporting.

REPORT_DIR="audit_reports"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
REPORT_FILE="$REPORT_DIR/log_audit_${TIMESTAMP}.txt"

echo "[*] Initializing System Log Auditor..."

# 1. Ensure report directory exists
mkdir -p "$REPORT_DIR"

# Initialize report header
echo "==========================================" > "$REPORT_FILE"
echo " SYSTEM SECURITY LOG AUDIT REPORT         " >> "$REPORT_FILE"
echo " Generated at: $(date)                    " >> "$REPORT_FILE"
echo "==========================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# 2. Audit Failed SSH Logins (Brute Force Detection)
echo "[*] Scanning system logs for failed login attempts..."
echo "--- FAILED LOGIN ATTEMPTS ---" >> "$REPORT_FILE"

if command -v journalctl &> /dev/null; then
    journalctl -u ssh --no-pager 2>/dev/null | grep "Failed password" >> "$REPORT_FILE"
elif [ -f /var/log/auth.log ]; then
    grep "Failed password" /var/log/auth.log >> "$REPORT_FILE"
else
    echo "[!] Warning: Could not access standard auth logs." >> "$REPORT_FILE"
fi
echo "" >> "$REPORT_FILE"

# 3. Audit Sudo Command Executions (Privilege Tracking)
echo "[*] Scanning recent administrative sudo activity..."
echo "--- SUDO COMMAND AUDIT ---" >> "$REPORT_FILE"

if command -v journalctl &> /dev/null; then
    journalctl _COMM=sudo --no-pager 2>/dev/null | tail -n 25 >> "$REPORT_FILE"
elif [ -f /var/log/auth.log ]; then
    grep "sudo:" /var/log/auth.log | tail -n 25 >> "$REPORT_FILE"
fi

# 4. Completion & Summary
echo "[SUCCESS] Audit complete!"
echo "[*] Report securely compiled to: ${REPORT_FILE}"
echo "[*] Displaying report summary..."
echo "------------------------------------------"
cat "$REPORT_FILE"
