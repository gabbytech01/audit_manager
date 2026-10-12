# Automated Log & Artifact Manager (`log_manager.sh`)

## Project Overview
A modular Bash automation script designed to manage security audit logs and test artifacts. This tool demonstrates core Linux shell scripting concepts including conditional directory validation, dynamic loop generation, file system verification, and user-prompted cleanups.

## Features Demonstrated
* **Variables & Shebang:** Clean execution headers and variable scoping for file prefixes and target directories.
* **Directory Automation:** Checks if the target `audit_logs` directory exists; creates it dynamically if absent.
* **Loop Iteration:** Automatically generates multiple formatted log files (`security_audit_1.log` through `security_audit_5.log`) containing runtime timestamps.
* **Validation Logic:** Uses `ls` and `wc -l` to verify that the expected number of files were successfully written.
* **Interactive Control Flow:** Prompts the user via input (`read -p`) to decide whether to preserve or purge the generated artifacts.

## Usage Instructions

1. Clone or download the script into your working environment.
2. Grant execution permissions:
   ```bash
   chmod +x log_manager.sh
