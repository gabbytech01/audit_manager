# System Security Log Auditor (`log_manager.sh`)

## Project Overview
A robust, modular Bash automation script designed for Linux system administration and security auditing. This tool automates the extraction, parsing, and reporting of critical security events from local system logs, providing rapid visibility into authentication failures and privileged activity.

## Features Demonstrated
- **Dynamic Directory & Timestamping:** Automatically structures output directories (`audit_reports/`) and generates unique timestamped audit logs to prevent file overwrites.
- **Brute-Force Detection:** Queries system logs (`journalctl` / `auth.log`) to isolate failed login attempts and unauthorized access vectors.
- **Privilege Escalation Tracking:** Filters and extracts recent administrative `sudo` and `su` commands to maintain a clear accountability trail of system modifications.
- **Dual Output Architecture:** Compiles findings into a secure file report while simultaneously rendering a live summary directly to the terminal.

## Prerequisites
- Linux Operating System (Tested on Parrot OS / Ubuntu / Debian)
- Standard utilities: `bash`, `grep`, `journalctl` (or standard auth logs)

## Usage Instructions

1. Clone or download the script into your working environment.
2. Grant execution permissions:


bash
chmod +x log_manager.sh

3. Run the auditor:

bash
./log_manager.sh

4. Review generated reports inside the `audit_reports/` directory.

## Sample Output Structure

text
==========================================
SYSTEM SECURITY LOG AUDIT REPORT

Generated at: ma 12 okt 2026 16:12:24 CEST
==========================================

--- FAILED LOGIN ATTEMPTS ---
(Clean / No unauthorized failures detected)

--- SUDO COMMAND AUDIT ---
okt 08 11:27:48 parrot sudo[5239]: cybergabby : COMMAND=/usr/local/bin/apt upgrade sqlmap
