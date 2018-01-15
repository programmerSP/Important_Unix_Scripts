#!/bin/ksh
############################################################################################################################
# SCRIPT NAME :   Create_new_directory.sh
# Description :   Create new directory specified in the input file of this script.
# Execution :     Create_new_directory.sh "path of the file having list of directories"
############################################################################################################################
export directory_list_file=$1
if [[ $# -ne 1 ]]; then
        echo "Required input parameters are not available."
        echo "Please provide the file name having list of directories that needs to be created."
        echo "Script for directory creation FAILED"
        exit 1
else

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
        echo -e "\nScript for directory creation completed successfully !!!"
fi
exit;
