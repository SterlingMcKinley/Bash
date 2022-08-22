#!/bin/bash
# =======================================================================
# SCRIPT NAME: old_log_cleanup.sh
#
# Description: This script will check all WebSphere app servers (linux)
#               for autorestart file. Output of this script will be placed 
#               in <> file to be reviewed for further follow up action.      
#
# REVISION HISTORY: N/A
#
# AUTHOR		   DATE			DETAILS
# --------------------- --------------- ---------------------------------
# Sterling McKinley	 2022-08-22	  Initial version
# =======================================================================

#Variables
Now=S (date +"%m-%d-gy")
logFile="/var/tmp/AutoRestartFileCheck_$Now.log"
serverlist=/var/tmp/serverlist.txt
location=/app/local/bin/wasnaAutoStart
location2=/etc/systemd/system/wasNode.service

#Retrieving server list from masterServerfile
cat <PATH> masterServerFile | sort-u > $serverlist
sed -i '/HOST/d' $serverlist
sed -i 's/ //g' $serverlist
sed -i 'S/\, \\//g' Sserverlist
sed -i '1d' $serverlist

echo "Please be patient. This script is processing SEVERAL servers. Thank you!"

#Checking for autorestart file
for i in 'cat $serverlist'
do
    echo "Processing server $i"
    result=" $hostname; $DATE; ssh $i -o PasswordAuthentication=No "ls $location $location2 2>/dev/null"
    if [[ 'echo $result' != "" ]]; then
        echo "AUTORESTART FILE EXISTS on $i" >> $logFile
    else
        echo "AUTORESTART FILE DOES NOT EXIST on $i" >> $logFile
    fi

done
