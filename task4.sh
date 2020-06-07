#!/bin/bash

dir="/var/log"
readtime=7
myDate=`date +%d%m%Y`

while read files;
do
  #Checking if backup folder is present or not within /var/log
  if [ ! -d "$dir/backup" ];then
    #If backup folder not present - make it.
    echo -e "backup directory not present. Creating backup directory in the /var/log directory.\n"
    mkdir -p $dir/backup

    #Again checking for backup folder
    if [ ! -d "$dir/backup" ];then
     echo "ERROR: Failed to create backup directory"
     echo "Execution Terminated"
     exit 0;
    fi
  fi

  #Taking directory path
  dirname="${files%/*}/"

  #Taking basename of file 
  fileBasename="${files:${#dirname}}"

  #changing directory to /var/log
  cd $dirname

  echo "Zipping $fileBasename file."
  gzip -q $fileBasename

  echo "Moving $fileBasename to backup directory"
  echo -e "mv $fileBasename.gz $dir/backup/$myDate_$fileBasename.gz \n"
  mv $fileBasename.gz $dir/backup/$myDate_$fileBasename.gz
done < <(find "$dir" \( -name '[a-zA-Z]*_[1-9]*.log' -o -name '*.log' \) -type f -mtime +$readtime -print);
