#!/bin/bash

# Script to install/uninstall Better-Brave
# This script applies policies to disable unwanted features in Brave

# Configuration
VERSION="1.0.4"
POLICY_URL="https://raw.githubusercontent.com/CJ-Montero/Better-Brave/main/policies.json"
POLICY_DIR="/etc/brave/policies/managed"
POLICY_FILE="$POLICY_DIR/better_brave-policies.json"
LOG_FILE="/var/log/better_brave_install.log"
TEMP_FILE="better_brave-policies.json"

# Function to log messages
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Function to check if a command is available
check_command() {
    if ! command -v "$1" &> /dev/null; then
        log_message "Error: $1 is not installed."
        echo "Please install $1 and try again."
        exit 1
    fi
}

# Function to check for superuser permissions
check_sudo() {
    if [[ $EUID -ne 0 ]]; then
        log_message "Error: This script requires superuser permissions."
        echo "Please run the script with sudo."
        exit 1
    fi
}

# Function to install policies
install_policies() {
    log_message "Starting Better-Brave v$VERSION installation"

    # Create directory for policies
    log_message "Creating directory $POLICY_DIR"
    mkdir -p "$POLICY_DIR" || {
        log_message "Error: Could not create directory $POLICY_DIR"
        exit 1
    }

    # Download policy file
    log_message "Downloading policies from $POLICY_URL"
    if wget -O "$TEMP_FILE" "$POLICY_URL"; then
        log_message "Download successful"
    else
        log_message "Error: Failed to download policy file"
        rm -f "$TEMP_FILE"
        exit 1
    fi

    # Copy policy file to the managed directory
    log_message "Copying policy file to $POLICY_DIR"
    if cp "$TEMP_FILE" "$POLICY_FILE"; then
        log_message "Policy file copied successfully"
        chmod 644 "$POLICY_FILE"
    else
        log_message "Error: Could not copy file to $POLICY_DIR"
        rm -f "$TEMP_FILE"
        exit 1
    fi

    # Clean up temporary file
    rm -f "$TEMP_FILE"
    log_message "Installation completed. Check policies at brave://policy"
    echo "Better-Brave v$VERSION installed successfully."
    echo "Visit brave://policy in Brave to confirm applied policies."
}

# Function to uninstall policies
uninstall_policies() {
    log_message "Starting Better-Brave uninstallation"
    if [[ -f "$POLICY_FILE" ]]; then
        read -p "Are you sure you want to uninstall Better-Brave? (y/n): " confirm
        if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
            log_message "Removing policy file $POLICY_FILE"
            rm -f "$POLICY_FILE" || {
                log_message "Error: Could not remove $POLICY_FILE"
                exit 1
            }
            log_message "Uninstallation completed"
            echo "Better-Brave uninstalled successfully."
        else
            log_message "Uninstallation canceled by user"
            echo "Uninstallation canceled."
            exit 0
        fi
    else
        log_message "Policy file not found at $POLICY_FILE"
        echo "Better-Brave is not installed."
        exit 0
    fi
}

# Check dependencies
check_command wget

# Check superuser permissions
check_sudo

# Interactive menu
echo "Better-Brave v$VERSION Installer"
echo "This script applies policies to disable unwanted features in Brave."
echo "1. Install Better-Brave"
echo "2. Uninstall Better-Brave"
echo "3. Exit"
read -p "Select an option (1-3): " option

case $option in
    1)
        install_policies
        ;;
    2)
        uninstall_policies
        ;;
    3)
        log_message "Execution canceled by user"
        echo "Exiting..."
        exit 0
        ;;
    *)
        log_message "Error: Invalid option ($option)"
        echo "Invalid option. Please select 1, 2, or 3."
        exit 1
        ;;
esac