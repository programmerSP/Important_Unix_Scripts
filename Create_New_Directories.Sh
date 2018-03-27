#!/bin/ksh
############################################################################################################################
# SCRIPT NAME :   146380_Create_new_directory.sh
# Description :   Create new directory specified in the input file of this script.
# Execution :     146380_Create_new_directory.sh "path of the file having list of directories"
############################################################################################################################
export directory_list_file=$1
if [[ $# -ne 1 ]]; then
	echo "====================================== " $'\n' " Parameter File Not Provided." $'\n'" ======================================"
	exitCode=1
	exit $exitCode
else
	ls -d $1
	exitCode=$?
	if [ $exitCode -ne 0 ]; then
        echo "====================================== " $'\n' " Input File Not Present in the said path. Please Check the Input File" $'\n' " ======================================"
        exitCode=1
	exit $exitCode
	fi
	file_count=`wc -l $GTPLHOME/Directories_List | cut -d ' ' -f 1`
	if [ $file_count -eq 0 ]; then
		echo "====================================== " $'\n' " Input File is Empty. File doesn't contains any directory details" $'\n' " ======================================"
		exitCode=1
		exit $exitCode
	fi
	
	if [ $exitCode -ne 1 ]; then
		echo "List of directories listed for creation:"
		directory_list=`cat $directory_list_file`
		echo "$directory_list"
		while read dir_name
		do
			echo -e "\nProcessing for Directory: $dir_name"
			echo "Checking if directory $dir_name already present..."
			chk_status=`ls -d $dir_name`
			if [[ $? -eq 0 ]]; then
				echo "Directory: $dir_name already available."
			else
				echo "Directory: $dir_name is not present, creating $dir_name ..."
				mkdir $dir_name
				if [[ $? -eq 0 ]]; then
					echo "Directory: $dir_name created."
					chmod 775 $dir_name
				else
					echo -e "\nError in directory creation."
					echo "Script execution FAILED while creation of directory $dir_name. Please check the error"
					exit 1
				fi
			fi
		done < $directory_list_file
		echo -e "\n Script for directory creation completed successfully !!!"
	fi
fi
exit $exitCode

