#!/bin/bash

myPath=`pwd`

echo "Which directory you are looking for:"
read DirName
echo "Your current directory path is $myPath. Are you looking $DirName in it:[Y/N]"
read choice

if [ "$choice" == "Y" ];then
   echo "Searching $DirName .... "
   if [ -d "$DirName" ];then
      echo "$DirName found in the $myPath"
   else
      echo "$DirName not found in the $myPath"
      echo "Let me create it for you ..."
      mkdir $DirName
      if [ -d "$DirName" ];then
         echo "Successfully created $DirName in the $myPath"
      else
         echo "Something went wrong... Please contact Tanmayee..."
      fi 
   fi
elif [ "$choice" == "N" ];then
     echo "Enter path where you are looking $DirName directory:"
     read yourPath
     echo "Jumping to $yourPath ..."
     cd $yourPath
     echo "Searching $DirName .... "
      if [ -d "$DirName" ];then
         echo "$DirName found in the $myPath"
      else
         echo "$DirName not found in the $myPath"
         echo "Let me create it for you ..."
         mkdir $DirName
         if [ -d "$DirName" ];then
            echo "Successfully created $DirName in the $myPath"
         else
            echo "Something went wrong... Please contact Tanmayee..."
         fi
      fi
else
    echo "Wrong Decision. Please try again.... "
fi
