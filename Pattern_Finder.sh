filename="$1" #File with strings to be searched ( each string on new line )
TargetFile="$2" #File in which the string is to be searched
while read -r line
do
        name="$line"
        grep $name $TargetFile
        exitcode=$?
        if [ $exitcode -eq 0 ]; then
                echo "$name present in file" >> Present_in_targetFile.txt
        else
                echo "$name not present in file"  >> Not_Present in_TargetFile.txt
        fi
done < "$filename"
exitcode=$?
if [ $exitcode -eq 0 ]; then
        echo "Script Ran successfully"
else
        echo "There is some problem with Script !"
fi
