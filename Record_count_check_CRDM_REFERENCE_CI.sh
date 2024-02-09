#!/bin/bash

cd /mnt/Staging/LMS/CRDM/Input/ICBS 

ls -a CRDM_REFERENCE_FILE_*_CI.CSV > CRDM_REFERENCE_FILE_I.txt

chmod 777 CRDM_REFERENCE_FILE_I.txt

cd /mnt/Staging/LMS/CRDM/Input/Transact 

ls -a CRDM_REFERENCE_FILE_*_CI.CSV > CRDM_REFERENCE_FILE_T.txt

chmod 777 CRDM_REFERENCE_FILE_T.txt

#################################################################################################################
#														#
#		CHECKING RECORDS COUNT										#
#														#
#################################################################################################################

# Entered TRANSACT Directory
cd /mnt/Staging/LMS/CRDM/Input/Transact

# Checked for TRANSACT file
Transact_filename=$(<$1)

# Delete first line in Transact file
 sed -i '1d' $Transact_filename

# Count Number of Records in TRANSACT File
Transact_Record_Count=$(cat $Transact_filename | wc -l)


# Entered ICBS Directory
cd /mnt/Staging/LMS/CRDM/Input/ICBS

# Checked for ICBS file
Icbs_filename=$(<$2)

# Delete first line in Transact file
 sed -i '1d' $Icbs_filename

# Count Number of Records in ICBS File
Icbs_Record_Count=$(cat $Icbs_filename | wc -l)


if [ $Transact_Record_Count -ge 1 ] && [ $Icbs_Record_Count -ge 1 ]
then
	echo " TRANSACT Source File has $Transact_Record_Count records. "
	echo " ICBS Source File has $Icbs_Record_Count records. "
	exit_code=$?
else
	echo "  Source File is Empty.. "
	exit_code=1
fi

if [ $exit_code != 0 ]
then
	echo "Job is aborted due to empty file"
	exit 1 # Failure
else
	echo "Prevalidation is performed successfully for record count"
	exit $? # Success
fi