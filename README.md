# Better-Brave Installer

## Overview
This repository contains the `install_better_brave.sh` script, a Bash script designed to install or uninstall policies for the Brave browser. These policies disable unwanted features, enhancing privacy and performance by removing bloat such as Brave Rewards, Brave Wallet, and other integrated services.

## Features
- Installs policies to disable unwanted Brave features.
- Provides an option to uninstall the applied policies.
- Includes error handling and logging for reliability.
- Features an interactive menu for user-friendly operation.
- Displays an ASCII art header for visual appeal.

## Prerequisites
- Brave browser installed.
- `wget` installed on the system.
- Superuser (sudo) privileges required.

## Usage
1. Clone or download the repository to your local machine.
2. Make the script executable:  
   ```bash
   chmod +x install_better_brave.sh
   ```
3. Run the script with sudo privileges:  
   ```bash
   sudo ./install_better_brave.sh
   ```
4. Follow the interactive menu to install or uninstall Better-Brave.

## Verification
After installation, verify the applied policies by visiting `brave://policy` in the Brave browser.

## Notes
- Ensure the `policies.json` file is accessible at `https://raw.githubusercontent.com/CJ-Montero/Better-Brave/main/policies.json`.
- The script logs activities to `/var/log/better_brave_install.log` for debugging.