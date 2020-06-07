#!/bin/bash

function segregateFile
{
  fname=$1
  fileBasename="${fname%.*.*}"
  fileExtension="${fname#*.}"
}


echo "List of all files which are moving:"
for files in `ls *.log.[0-9]*`;
do
  if [ -f $files ];then
   echo $files;
  else
   echo "$files is not file"
  fi
done

#Another way to list down txt file
echo -e "\nSegregating basename and extention of a file:"
echo "---------------------------------------------"
echo "BASENAME         EXTENTION"
echo "---------------------------------------------"
ls *.log.[0-9]* | while read files;
do
  #Calling segregateFile function
  segregateFile $files
  echo "$fileBasename                 $fileExtension"
done
echo -e "---------------------------------------------\n"

#Printing date in ddmmyyyy format
echo "Print date command to show in ddmmyyyy"
myDate=`date +%d%m%Y`
echo "Current date: $myDate"

echo -e "\nAppendind date to log file:"
dir=`pwd`
ls *.log.[0-9]* | while read files;
do
      #Calling segregateFile function
      segregateFile $files
      #Appending date and mrenaming file with mv command.
      mv $files $fileBasename-${myDate}.log
      if [ -f "$fileBasename-${myDate}.log" ];then echo "Renamed $files to $fileBasename-${myDate}.log ";fi
done
