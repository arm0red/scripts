#!/usr/bin/env python3
# A simple script to display basic Linux system information.

import platform
import os

def get_system_info():
    """Gathers and prints key system information."""
    print("--- System Information ---")

    # Operating System
    print(f"OS: {platform.system()}")

    # Distribution Info (more specific for Linux)
    # The os.path.exists check is to prevent errors on non-Linux systems
    if os.path.exists('/etc/os-release'):
        with open('/etc/os-release') as f:
            for line in f:
                if line.startswith('PRETTY_NAME='):
                    distro = line.split('=')[1].strip().strip('"')
                    print(f"Distribution: {distro}")
                    break
    else:
        # Fallback for systems without /etc/os-release
        print(f"Distribution: {platform.version()}")


    # Kernel Version
    print(f"Kernel Version: {platform.release()}")

    # System Architecture
    print(f"Architecture: {platform.machine()}")

    # Hostname
    print(f"Hostname: {platform.node()}")

    # Processor Type
    print(f"Processor: {platform.processor()}")

    # Python Version
    print(f"Python Version: {platform.python_version()}")

    print("------------------------")

if __name__ == "__main__":
    get_system_info()
