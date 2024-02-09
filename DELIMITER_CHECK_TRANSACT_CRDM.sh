#!/bin/bash

#################################################################################################################
#														#
#		CHECKING ICS FILE DELIMITER									#
#														#
#################################################################################################################


# Entered TRANSACT Directory

cd /mnt/Staging/LMS/CRDM/Input/Transact

if [ $(wc -c < $1) == 0 ]
then
	echo "Empty."
	exit_code=1
else
	filename=$(<$1)
	var=$( grep -v "," $filename | wc -l)  #Give the count of the line that do not match the pattern COMMA.
	if [ $var == 0 ] 
	then
		echo "TRANSACT File has Correct delimiter as COMMA (,)."
		exit 0 #Success Scenario
	else 
		echo "TRANSACT File has incorrect Delimiter for $var records."
		exit 1 #Failed Scenario
	fi
	exit_code=$?
fi

if [ $exit_code != 0 ]
then
	echo "Job is aborted due to Missing Source file"
	exit 1 # Failure
else
	echo "Prevalidation is performed successfully for delimiter check"
	exit $? # Success
fi