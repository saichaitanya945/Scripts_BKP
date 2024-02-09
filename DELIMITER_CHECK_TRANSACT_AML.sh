#!/bin/bash

#################################################################################################################
#														#
#		CHECKING ICS FILE DELIMITER									#
#														#
#################################################################################################################


# Entered TRANSACT Directory

cd /mnt/Staging/LMS/AML/Input/Transact


# Checked for TRANSACT file

filename=$1


# Check for correct Deilimiter

var=$( grep -v "," $filename | wc -l)  #Give the count of the line that do not match the pattern COMMA.

if [ $var == 0 ] 
then
	echo "TRANSACT File has Correct delimiter as PIPE (|)."
	exit 0 #Success Scenario
else 
	echo "TRANSACT File has incorrect Delimiter for $var records."
	exit 1 #Failed Scenario
fi

