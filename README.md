# Better-Brave Installer

## Overview
This repository contains the `install_better_brave.sh` script, a Bash script designed to install or uninstall policies for the Brave browser. These policies disable unwanted features, enhancing privacy and performance by removing bloat such as Brave Rewards, Brave Wallet, and other integrated services.

## Features
- Installs policies to disable unwanted Brave features.
- Provides an option to uninstall the applied policies.
- Includes error handling and logging for reliability.
- Features an interactive menu for user-friendly operation.


## Prerequisites
- Brave browser installed.
- `wget` installed on the system.
- Superuser (sudo) privileges required.

## Disabled Features
The following table lists the features disabled by the Better-Brave script:

| Feature                | Description                                      |
|------------------------|--------------------------------------------------|
| Brave Rewards          | Disables the cryptocurrency rewards system.      |
| Brave Wallet           | Disables the built-in cryptocurrency wallet.     |
| Brave VPN              | Disables the integrated VPN service.             |
| Brave AI Chat          | Disables the AI chat functionality.              |
| Tor Integration        | Disables the Tor browsing mode.                  |
| Password Manager       | Disables the built-in password management.       |
| JavaScript (Optional)  | May block JavaScript execution (depending on configuration). |

*Note: The exact set of disabled features depends on the `policies.json` file. Verify the applied policies at `brave://policy` after installation.*

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