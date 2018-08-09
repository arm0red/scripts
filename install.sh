#!/bin/bash

echo "Installing scripts..."
sudo cp arm0red /usr/local/bin/arm0red

echo "Installing Update Script..."
sudo cp aptup /usr/local/bin/aptup
#sudo cp dnfup /usr/local/bin/dnfup
#sudo cp pacup /usr/local/bin/pacup

echo "Installing Backup Script..."
sudo cp backup /usr/local/bin/backup

echo "Installing Bitcoin Script..."
sudo cp bitcoin /usr/local/bin/bitcoin

echo "Installing Kali-Post-Install Script..."
sudo cp kali-post-install /usr/local/bin/kali-post-install

echo "Installing msfstart Script..."
sudo cp msfstart /usr/local/bin/msfstart

echo "Installing wlan1mon Script..."
sudo cp wlan1mon /usr/local/bin/wlan1mon

echo "Installing sysinfo Script..."
sudo cp sysinfo /usr/local/bin/sysinfo

echo "Installing newhn Script..."
sudo cp newhn /usr/local/bin/newhn

