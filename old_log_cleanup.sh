#!/bin/bash
# ======================================================================
# SCRIPT NAME: Diagnostic5.sh
# Description: Removes all log files in the directory older than a 
#              certain number of days
#
# Script instructions: In order to execute the log clean up script:
#                       1- Specify the the folder/directory path
#                           as the location requiring clean up
#                       2- Specify the number of days worth of files to 
#                           keep — anything older than the specified 
#                           # of days will be DELETED
#
# REVISION HISTORY: N/A
#
# AUTHOR		   DATE			DETAILS
# --------------------- --------------- --------------------------------
# Sterling McKinley	 2022-08-22	  Initial version
# ======================================================================
FOLDER=$1
N_DAYS=$2
 
# Validate
if [ "$FOLDER" == "" ] || [ "$N_DAYS" == "" ]
then
echo "Usage: $0 folder number_of_days"
exit 1
fi
 
if [ ! -d "$FOLDER" ]
then
echo "$FOLDER is not a directory"
exit 2
fi
 
# Older files will be deleted
echo "Deleting files in $FOLDER older than $N_DAYS days"
find $FOLDER/* -mtime +$N_DAYS -exec rm {} \;