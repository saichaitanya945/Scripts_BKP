#!/bin/bash

#################################################################################################################
#														#
#		CHECKING FILE DELIMITER										#
#														#
#################################################################################################################


# Entered ICBS Directory

cd /mnt/Staging/LMS/AQM/Input/ICBS


# Checked for ICBS file

filename=$1

echo "$filename"

# Check for correct Deilimiter

var=$( grep -v "|" $filename | wc -l)  #Give the count of the line that do not match the pattern PIPE.

if [ $var == 0 ] 
then
	echo "ICBS File has Correct delimiter as PIPE (|)."
	exit 0 #Success Scenario
else 
	echo "ICBS File has incorrect Delimiter for $var records."
	exit 1 #Failed Scenario
fi

