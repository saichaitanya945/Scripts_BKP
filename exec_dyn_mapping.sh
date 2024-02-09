# ##################################################################################################
# Script Name	: exec_dyn_mapping.sh
# Version	: 1.0
# Description	: Utility to executue Informatica masking dynamic mapping in parallel. This script is
#		  dynamic and will be triggered in parallel in the workflow
# ##################################################################################################
#!/bin/bash

# Variables 
CONFIGPATH=""
COMMANDSFILENAME=""

if [ "$#" -ne 0 ]
then	i=0
	for ((i = 1; i <= $#; i++ ))
	do	# if only source file path is provided as argument
		if [ "${!i}" = "-c" ]
		then	((i++))
			if [ ! -z "${!i}" ] 
			then	CONFIGPATH="${!i}"
				# Check if the Source Server Path has a "/" in the end; If not, add it
			fi
			((i--))
		fi
		if [ "${!i}" = "-f" ]
		then	((i++))
			if [ ! -z "${!i}" ] 
			then	COMMANDSFILENAME="${!i}"
			fi
			((i--))
		fi
	done
else	echo -e "exec_dyn_mapping.sh : usage error. output not generated."
	exit 1
fi


if [ -e ${CONFIGPATH}${COMMANDSFILENAME} ]
then 
  echo "Execute file commands_execute.txt exists..Continuing  script..."
else 
  echo "Execute file commands_execute.txt doesn't exists..Exiting script..."
  exit 1 
fi

input=${CONFIGPATH}${COMMANDSFILENAME}
while IFS= read -r line
do
echo  $INFA_HOME/server/bin/infacmd.sh
echo "$line"
$line
done < "$input"
