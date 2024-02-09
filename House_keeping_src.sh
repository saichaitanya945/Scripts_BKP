#!/bin/bash

filepath_icbs="/appdir/BDO_LMS/INBOUND/ARCHIVE/ICBS/"
filepath_Transact="/appdir/BDO_LMS/INBOUND/ARCHIVE/TRANSACT/"

if [[ -z "${filepath_icbs}" || -z "${filepath_Transact}" ]]
then
	echo "One of the file path is empty kindly populate."
		else
			if [[ ! -d "${filepath_icbs}" || ! -d "${filepath_Transact}" ]]
			then 
				echo "Kindly validate path"	
				else
				    find ${filepath_icbs} -mtime +0 -delete
				    echo "Files older than 7days deleted from $filepath_icbs"
    				    find ${filepath_Transact} -mtime +0 -delete
   				    echo "Files older than 7days deleted from $filepath_Transact"
			fi
fi
