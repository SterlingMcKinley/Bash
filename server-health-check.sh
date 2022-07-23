#!/bin/bash
# ======================================================================
# SCRIPT NAME: servehealth-check1.sh
#
# PURPOSE: This script will execute several commands in an effort to monitor the server resources.
#
# REVISION HISTORY: N/A
#
# AUTHOR				DATE			DETAILS
# --------------------- --------------- --------------------------------
# Sterling McKinley	 2022-07-23	  Initial version
# ======================================================================
#!/bin/bash

echo "Hostname | Date | Time"
hostname;date;time;

echo "uptime:"
uptime
echo "--------------------"
echo "--------------------"
echo "Currently connected:"
w
echo "--------------------"
echo "--------------------"
echo "free"
free
echo "--------------------"
echo "--------------------"
echo "checking filesystem utilization"
df -h
echo "--------------------"
echo "--------------------"
echo "High process utilization:"
top -b | head -3
echo "--------------------"
top -b | head -10 | tail -4
echo "--------------------"
echo "--------------------"
echo "ps running processes"
ps -ef | grep java
echo "--------------------"
echo "--------------------"
echo "vmstat"
vmstat 1 5
echo "--------------------"
echo "--------------------"
echo "netstat"
netstat -a
echo "--------------------"
echo "--------------------"