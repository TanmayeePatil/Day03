#!/bin/bash

function segregateFile
{
  fname=$1
  fileBasename="${fname%.*}"
  fileExtension="${fname##*.}"
}


echo "List of all files which are moving:"
for files in `ls *txt`;
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
ls *.txt | while read files;
do
  #Calling segregateFile function
  segregateFile $files
  echo "$fileBasename                 $fileExtension"
done
echo -e "---------------------------------------------\n"

echo "Creating folder using basename and moving files to it:"
dir=`pwd`
ls *txt | while read files;
do
      #Calling segregateFile function
      segregateFile $files
      if [ ! -d $fileBasename ];then
        echo "Making $fileBasename directory"
        mkdir $fileBasename
        mv $files $fileBasename
        if [ -f "$fileBasename/$files" ];then echo "Moved $files into $fileBasename directory.";fi
      fi
done
