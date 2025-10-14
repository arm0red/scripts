#!/bin/bash

# ==============================================================================
# Universal Linux System Updater
#
# Description:
# This script detects the system's package manager and runs the appropriate
# commands to update and upgrade all packages. It requires root/sudo
# privileges to execute.
#
# Supported Package Managers:
# - ujust (Project Bluefin / Fedora Atomic Desktops)
# - APT (Debian, Ubuntu)
# - DNF (Fedora, RHEL 8+)
# - YUM (CentOS, RHEL 7)
# - Pacman (Arch Linux)
# - Zypper (openSUSE)
# - APK (Alpine Linux)
#
# ==============================================================================

#                       _____               _  
#                      |  _  |             | | 
#   __ _ _ __ _ __ ___ | |/' | _ __ ___  __| | 
#  / _` | '__| '_ ` _ \|  /| || '__/ _ \/ _` | 
# | (_| | |  | | | | | \ |_/ /| | |  __/ (_| | 
#  \__,_|_|  |_| |_| |_|\___(_)_|  \___|\__,_| 

base64 -d <<<"H4sIAAAAAAAAA22NQQoAIQhF957CXQ0MeKHgdxAPP1+tWUSKEs+nqV4DESdTlbvtOfSDeeo8k7kb
iyNr7D9gW7opJl8tQINOOoN3jeOkFmBJwuq56PVd5VCnZovHSt/XB/DCEXqgKkJ0PEHj6SWpyAe/
8We1GwEAAA==" | gunzip
echo -e "\e[31;1m ***** \e[34;1m arm0.red Security \e[31;1m *****\e[0m"
echo -e "\e[31;1m ***** \e[34;1m Update Script v1.0 \e[31;1m *****\e[0m"
echo ""

# --- Check for Root Privileges ---
# Ensure the script is run as the root user or with sudo.
if [[ $EUID -ne 0 ]]; then
   echo "Error: This script must be run as root or with sudo."
   exit 1
fi

echo "Detecting package manager..."

# --- Package Manager Detection and Update Logic ---

# Check for ujust (Project Bluefin / Fedora Atomic Desktops)
if command -v ujust &> /dev/null; then
    echo "ujust detected. Running update..."
    ujust update

# Check for APT (Debian/Ubuntu)
elif command -v apt &> /dev/null; then
    echo "APT detected. Updating system..."
    apt update && apt upgrade -y

# Check for DNF (Fedora/RHEL)
elif command -v dnf &> /dev/null; then
    echo "DNF detected. Updating system..."
    dnf upgrade --refresh -y

# Check for YUM (CentOS/Older RHEL)
elif command -v yum &> /dev/null; then
    echo "YUM detected. Updating system..."
    yum update -y

# Check for Pacman (Arch Linux)
elif command -v pacman &> /dev/null; then
    echo "Pacman detected. Updating system..."
    pacman -Syu --noconfirm

# Check for Zypper (openSUSE)
elif command -v zypper &> /dev/null; then
    echo "Zypper detected. Updating system..."
    zypper refresh && zypper update -y

# Check for APK (Alpine Linux)
elif command -v apk &> /dev/null; then
    echo "APK detected. Updating system..."
    apk update && apk upgrade

# If no known package manager is found
else
    echo "Could not detect a known package manager. Exiting."
    exit 1
fi

echo "System update process finished."
