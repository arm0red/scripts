import subprocess
import platform
import os
import json

def get_private_ip():
    try:
        result = subprocess.check_output(["ip", "addr", "show"]).decode("utf-8")
        for line in result.splitlines():
            if "inet " in line and "127.0.0.1" not in line:
                ip = line.split("inet ")[1].split("/")[0]
                return ip
        return "Not Found"
    except subprocess.CalledProcessError:
        return "Not Found"

def get_public_ip():
    try:
        result = subprocess.check_output(["curl", "-s", "ifconfig.me"]).decode("utf-8").strip()
        return result
    except subprocess.CalledProcessError:
        return "Not Found"

def get_default_gateway():
    try:
        result = subprocess.check_output(["route", "-n"]).decode("utf-8")
        for line in result.splitlines():
            if "UG" in line:
                return line.split()[2]
        return "Not Found"
    except subprocess.CalledProcessError:
        return "Not Found"

def get_hostname():
    return platform.node()

def get_logged_in_users():
    try:
        result = subprocess.check_output(["who"]).decode("utf-8")
        if result.strip():
            return result.strip()
        else:
            return "No users logged in."
    except subprocess.CalledProcessError:
        return "Not Found"

def get_uptime():
    try:
        result = subprocess.check_output(["uptime"]).decode("utf-8")
        return result.split("up ")[1].strip()
    except subprocess.CalledProcessError:
        return "Not Found"

def get_storage_info():
    try:
        result = subprocess.check_output(["df", "-h"]).decode("utf-8")
        return result
    except subprocess.CalledProcessError:
        return "Not Found"

def get_ram_info():
    try:
        result = subprocess.check_output(["free", "-h"]).decode("utf-8")
        return result
    except subprocess.CalledProcessError:
        return "Not Found"

def get_top_processes():
    try:
        # Try a much simpler ps command first
        result = subprocess.check_output(["ps", "aux"], stderr=subprocess.DEVNULL).decode("utf-8")
        return "Could not retrieve detailed process information." # Indicate limitation
    except subprocess.CalledProcessError:
        return "No processes found."


def main():
    system_info = {
        "Public IP Address": get_public_ip(),
        "Private IP Address": get_private_ip(),
        "Default Gateway": get_default_gateway(),
        "Hostname": get_hostname(),
        "Logged-in Users": get_logged_in_users(),
        "Uptime": get_uptime(),
        "Storage Information": get_storage_info(),
        "RAM Information": get_ram_info(),
        "Top Memory Processes": get_top_processes(),
    }
 

    print("\033[1;34m" + "System Information" + "\033[0m")
    print("-" * 20)

    for key, value in system_info.items():
        print(f"\033[1;32m{key}\033[0m: \033[1;33m{value}\033[0m")
    print("-" * 20)

if __name__ == "__main__":
    ascii_art = r"""
                          _____               _  
                         |  _  |             | | 
      __ _ _ __ _ __ ___ | |/' | _ __ ___  __| | 
     / _` | '__| '_ ` _ \|  /| || '__/ _ \/ _` | 
    | (_| | |  | | | | | \ |_/ /| | |  __/ (_| | 
     \__,_|_|  |_| |_| |_|\___(_)_|  \___|\__,_| 
    """
    
    print(ascii_art)
    main()
