#!/bin/bash
clear
#                       _____               _  
#                      |  _  |             | | 
#   __ _ _ __ _ __ ___ | |/' | _ __ ___  __| | 
#  / _` | '__| '_ ` _ \|  /| || '__/ _ \/ _` | 
# | (_| | |  | | | | | \ |_/ /| | |  __/ (_| | 
#  \__,_|_|  |_| |_| |_|\___(_)_|  \___|\__,_| 

cat arm0red
echo -e "\e[31;1m ***** arm0.red Security *****\e[0m"
echo -e "\e[31;1m ***** System Info Script *****\e[0m"
echo ""

# This script will return the following set of system information:

# Hostname information:
echo -e "\e[31;1m ***** HOSTNAME INFORMATION *****\e[0m"
hostnamectl
echo ""

# File system disk space usage:
echo -e "\e[31;1m ***** FILE SYSTEM DISK SPACE USAGE *****\e[0m"
df -h
echo ""

# Free and used memory in the system:
echo -e "\e[31;1m ***** FREE AND USED MEMORY *****\e[0m"
free -h
echo ""

# System uptime and load:
echo -e "\e[31;1m ***** SYSTEM UPTIME AND LOAD *****\e[0m"
uptime
echo ""

# Logged-in users:
echo -e "\e[31;1m ***** CURRENTLY LOGGED-IN USERS *****\e[0m"
who | tr -s ' ' | cut -d' ' -f1
echo ""

# Top 5 processes as far as memory usage is concerned
echo -e "\e[31;1m ***** TOP 5 MEMORY-CONSUMING PROCESSES *****\e[0m"
ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6
echo ""

# Private IPv4
echo -e "\e[31;1m ***** Private IP *****\e[0m"
ip a | grep 'inet' | grep -v '127.0.0.1' | grep -v 'inet6' | awk '{print $2}' | cut -d/ -f1
echo ""

# Public IP
echo -e "\e[31;1m ***** Public IP *****\e[0m"
curl ifconfig.co
echo ""
echo -e "\e[1;32mDone.\e[0m"


