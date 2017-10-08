#!/bin/bash
clear
#                       _____               _  
#                      |  _  |             | | 
#   __ _ _ __ _ __ ___ | |/' | _ __ ___  __| | 
#  / _` | '__| '_ ` _ \|  /| || '__/ _ \/ _` | 
# | (_| | |  | | | | | \ |_/ /| | |  __/ (_| | 
#  \__,_|_|  |_| |_| |_|\___(_)_|  \___|\__,_| 

cat arm0red
# Assign existing hostname to $hostn
hostn=$(cat /etc/hostname)

# Display existing hostname
echo "Existing hostname is $hostn"

# Ask for new hostname $newhost
echo "Enter new hostname: "
read newhost

# Change hostname in /etc/hosts & /etc/hostname
sudo sed -i "s/$hostn/$newhost/g" /etc/hosts
sudo sed -i "s/$hostn/$newhost/g" /etc/hostname

# Display new hostname
echo "Your new hostname is $newhost"

# Press a key to reboot
read -s -n 1 -p "Press any key to reboot"
sudo reboot
