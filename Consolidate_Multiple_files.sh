#ident "%W%"
#!/bin/sh

filename="$1"
#export ResultFile= "echo $filename | cut -d '.' -f 1"
#echo $ResultFile
while read -r line
do
    name="$line"
    #ResultFile= echo ${filename:(-4)}
    #echo $ResultFile
    echo " /*FileName :  $name */" >> Result.txt
    echo $'\n' >> Result.txt
    cat $name  >> Result.txt
    exitcode=$?
    echo "$name : Status --> $exitcode "
    echo $'\n' $'\n' >> Result.txt
done < "$filename"
