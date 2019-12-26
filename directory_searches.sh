#!/bin/bash

#$1=ip
#$2=port
#"usage is ./directory_searches.sh 10.11.1.xxx port"
echo "Starting Dirb scan"
dirb http://$1:$2 -w /usr/share/wordlists/dirb/common.txt -o dirb$2.txt&

echo "Starting Nikto scan"
nikto -host http://$1:$2 -o nikto$2.txt&

echo "Starting GoBuster scan"
gobuster -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -u http://$1:$2 -o gobuster$2.txt&

#echo "All Scans Started"

wait
echo "Scans Finished"



