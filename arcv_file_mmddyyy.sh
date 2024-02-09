#!/bin/bash

file_name=$1                        #source_path_file
file_name1=$2                       #destination_path_file

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

mv $new_fileName $file_name1 

# remove file in source path
rm $file_name

echo "you should see new file generated with timestamp on it.."

