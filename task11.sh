#!/bin/bash

echo "Checking environment variable usersecret..."
isCheck=`env | grep -i usersecret`

if [ ! -z "$isCheck" ] && [ "$isCheck" != " " ];then
     var=`cat $isCheck | awk -F[=] '{print $1}'`
     echo "Found environment variable usersecret: $isCheck"
     #Checking usersecret isuppercase or lowercase
     if [[ $var =~ [A-Z] ]];then
          isUpper="YES"
     elif [[ $var =~ [a-z] ]];then
          isLower="YES"
     fi
     #Cheching if value of usersecret match with dH34xJaa23
     if [ "$isCheck" == "dH34xJaa23" ];then
        #If uppercase
        if [ "$isUpper" == "YES" ];then
           export USERSECRET=dH34xJaa23
           isSet=`env | grep -i usersecret`
           if [ ! -z "$isSet" ];then echo "Created environment variable usersecret: $isSet"; else echo "Something went wrong";fi
        #if lowercase
        elif [ "$isLower" == "YES" ];then
           export usersecret=dH34xJaa23
            isSet=`env | grep -i usersecret`
            if [ ! -z "$isSet" ];then echo "Created environment variable usersecret: $isSet"; else echo "Something went wrong";fi
        else
        #if not uppercase or lowercase
           export $var=dH34xJaa23
            isSet=`env | grep -i $var`
            if [ ! -z "$isSet" ];then echo "Created environment variable usersecret: $isSet"; else echo "Something went wrong";fi
        fi
     fi
else
       echo "Not found environment variable usersecret"
       #if variable not present ... creating new entry in env...
       export USERSECRET=dH34xJaa23
       #Checking if created or not
       isSet=`env | grep -i usersecret`
       if [ ! -z "$isSet" ];then echo "Created environment variable usersecret: $isSet"; else echo "Something went wrong";fi
       echo -e "\n\n------------------------------------------------------------------"
       echo "Printing all environment variable:"
       echo "------------------------------------------------------------------"
       env
       echo "------------------------------------------------------------------"
fi
