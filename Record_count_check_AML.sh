#!/bin/bash

#################################################################################################################
#														#
#		CHECKING RECORDS COUNT										#
#														#
#################################################################################################################


# Entered TRANSACT Directory
cd /mnt/Staging/LMS/AML/Input/Transact

# Checked for TRANSACT file
Transact_filename=$1

# Delete first line in Transact file
 sed -i '1d' $Transact_filename

# Count Number of Records in TRANSACT File
Transact_Record_Count=$(cat $Transact_filename | wc -l)

# Checked for TRANSACT file Header
# head -1 $Transact_filename >> /appdir/BDO_LMS/INBOUND/SOURCE_FILE/MERGE/TRANSACT/Transact_Header.txt

# Entered ICBS Directory
cd /mnt/Staging/LMS/AML/Input/ICBS

# Checked for ICBS file
Icbs_filename=$2

# Delete first line in Transact file
 sed -i '1d' $Icbs_filename

# Copied Transact Header in ICBS folder
# cp /appdir/BDO_LMS/INBOUND/SOURCE_FILE/MERGE/TRANSACT/Transact_Header.txt /appdir/BDO_LMS/INBOUND/SOURCE_FILE/MERGE/ICBS

# Append TRANSACT File headers to ICBS File as Headers
# sed -i "1i $(head -n 1 Transact_Header.txt)" $Icbs_filename

# Count Number of Records in ICBS File
Icbs_Record_Count=$(cat $Icbs_filename | wc -l)

if [ $Transact_Record_Count -ge 2 ] && [ $Icbs_Record_Count -ge 1 ]
then
	echo " TRANSACT Source File has $Transact_Record_Count records. "
	echo " ICBS Source File has $Icbs_Record_Count records. "
	#rm /appdir/BDO_LMS/INBOUND/SOURCE_FILE/MERGE/ICBS/Transact_Header.txt
        #rm /appdir/BDO_LMS/INBOUND/SOURCE_FILE/MERGE/TRANSACT/Transact_Header.txt
	exit_code=$?
else
	echo "  Source File is Empty.. "
	#rm /appdir/BDO_LMS/INBOUND/SOURCE_FILE/MERGE/ICBS/Transact_Header.txt
        #rm /appdir/BDO_LMS/INBOUND/SOURCE_FILE/MERGE/TRANSACT/Transact_Header.txt
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