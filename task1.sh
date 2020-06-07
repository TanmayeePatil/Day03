#!/bin/bash

echo "--------------------------------------------------------------------------"
echo "View /etc/passwd file"
echo "--------------------------------------------------------------------------"
cat ~/TerminalCommands/Practice/tmpPasswd
echo "--------------------------------------------------------------------------"

echo -e "\n\n--------------------------------------------------------------------------"
echo "Print the 1st field from passwd file:"
echo "--------------------------------------------------------------------------"
echo "USERNAME"
echo "__________"
cat ~/TerminalCommands/Practice/tmpPasswd | awk -F: '{print $1}'
echo "--------------------------------------------------------------------------"

echo -e "\n\n--------------------------------------------------------------------------"
echo "Print all userids > 1000"
echo "--------------------------------------------------------------------------"
echo "USERID >1000"
echo "_______________"
cat ~/TerminalCommands/Practice/tmpPasswd | awk -F: '$3 >1000 {print $3}'
echo "--------------------------------------------------------------------------"

echo -e "\n\n--------------------------------------------------------------------------"
echo "Print the 2nd field to get home directory"
echo "--------------------------------------------------------------------------"
echo "USER HOME DIRECTORY"
echo "_____________________"
cat tmpPasswd | awk -F: '$3 >1000 {print $6}'
echo "--------------------------------------------------------------------------"

echo -e "\n\n--------------------------------------------------------------------------"
echo "Use command substitution to get user list and home directory"
echo "--------------------------------------------------------------------------"
myVAR=`cat ~/TerminalCommands/Practice/tmpPasswd | awk -F: '$3 >1000 {print $1"="$6}'`
echo "USERNAME     HOME DIRECTORY"
echo "____________________________"
echo $myVAR | tr " " "\n"
echo "--------------------------------------------------------------------------"

echo -e "\n\n--------------------------------------------------------------------------"
echo "Change ownership of above home directory with user which is retrieve above"
echo "--------------------------------------------------------------------------"
echo "NOTE: As this is my example tmpPasswd file hence the path in it are not exists"
echo "Thats why cannot change ownership of folders"
echo "We use sudo \"chown -R username:group directory\" to chnage the ownership of folder."
echo "--------------------------------------------------------------------------"
