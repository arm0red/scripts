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
echo -e "\e[31;1m ***** Home Backup Script *****\e[0m"
echo ""

echo -e "\e[31;1m Enter File/Directory to be backed up:\e[0m"
read DIR

echo -e "\e[31;1m Enter Output Location:\e[0m"
read OL

IF=${DIR%}
echo -e "\e[31;1m ***** BACKING UP $IF *****\e[0m"
echo ""

OF=$OL/backup-${IF##*/}-$(date +%Y%m%d).tar.gz
tar -czvf $OF $IF

echo -e "\e[1;32mDone.\e[0m"


