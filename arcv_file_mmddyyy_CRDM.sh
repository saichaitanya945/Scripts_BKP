#!/bin/bash

echo $1 > temp.txt

if(grep -i "_File_I." temp.txt)
then
	echo "LUCKY_ICBS"
        cd /mnt/Staging/LMS/CRDM/Input/ICBS

	file_name=$(<$1)                   #source_path_file	
	file_Path=$2                       #destination_path_file

	current_time=$(date "+%m%d%Y_%H:%M%p")

	echo "current Time:$current_time"

	file_extension="${file_name##*.}"

	#appending date format in file

	new_fileName="${file_name%.*}_${current_time}.$file_extension"

	echo "New fileName:""$new_fileName"

	#copying file

	cp $file_name $new_fileName

	#file_extension="${file_name##*.}"

	# move  file to archival folder

	mv $new_fileName $file_Path 

	# remove file in source path
	rm $file_name

	echo "you should see new file generated with timestamp on it.."
	
	cd /mnt/Staging/LMS/Scripts
	rm temp.txt
fi

if(grep -i "_File_T." temp.txt)
then
	echo "LUCKY_TDH"
        cd /mnt/Staging/LMS/CRDM/Input/Transact

	file_name=$(<$1)                        #source_path_file
	file_Path=$2                       #destination_path_file

	current_time=$(date "+%m%d%Y_%H:%M%p")

	echo "current Time:$current_time"

	file_extension="${file_name##*.}"

	#appending date format in file

	new_fileName="${file_name%.*}_${current_time}.$file_extension"

	echo "New fileName:""$new_fileName"

	#copying file

	cp $file_name $new_fileName

	#file_extension="${file_name##*.}"

	# move  file to archival folder

	mv $new_fileName $file_Path 
	pwd
	# remove file in source path
	rm $file_name

	echo "you should see new file generated with timestamp on it.."

	cd /mnt/Staging/LMS/Scripts
	rm temp.txt

fi
