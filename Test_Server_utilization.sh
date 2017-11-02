#!/bin/bash
echo "Following are the Server Information Details For Dev : SD-2E06-2D06 : "
echo $'\n'
echo "Time :"
date;
echo $'\n'
echo "uptime:"
uptime
echo $'\n'
echo $'\n'
echo "Currently connected:"
w | head -10
echo $'\n'
echo "--------------------"
echo $'\n'
echo "Last logins:"
last -a |head -3
echo $'\n'
echo "--------------------"
echo "Disk and memory usage:"
df -h | xargs | awk '{print "Free/total disk: " $11 " / " $9}'
echo $'\n'
PART=sda1
USE=`df -h |grep $PART | awk '{ print $5 }' | cut -d'%' -f1`
echo "Percent used: $USE"
echo $'\n'
free -m | xargs | awk '{print "Free/total memory: " $17 " / " $8 " MB"}'
echo "--------------------"
echo $'\n'
start_log=`head -1 /var/log/messages |cut -c 1-12`
echo $'\n'
oom=`grep -ci kill /var/log/messages`
echo $'\n'
echo -n "OOM errors since $start_log :" $oom
echo ""
echo $'\n'
echo "--------------------"
echo $'\n'
echo "Utilization and most expensive processes:"
top -b |head -3
echo $'\n'
echo
top -b |head -10 |tail -4
echo $'\n'
echo "--------------------"
echo $'\n'
echo "Open TCP ports:"
nmap -p- -T4 127.0.0.1
echo $'\n'
echo "--------------------"
echo $'\n'
echo "Current connections:"
ss -s
echo "--------------------"
echo $'\n'
echo "Top Twenty Processes:"
ps auxf --width=200 | head -20
echo $'\n'
echo "--------------------"
echo $'\n'
echo "vmstat:"
vmstat 1 5
echo $'\n'
echo $'\n'
echo " Above Information is Correct and Contains Specifications about Dev : SD-2E06-2D06 Server."| echo $"\n" | echo "This Script is written by ::>>  Soumen Patra "
