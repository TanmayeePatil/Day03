#!/bin/bash

echo "-------------------------------------------------------------------------------"
echo "View /var/log/httpd/access.log"
count=`cat /var/log/httpd/access.log | wc -l`
echo "/var/log/httpd/access.log has $count line in the file. hence printing last 15 lines."
echo "-------------------------------------------------------------------------------"
tail -15 /var/log/httpd/access.log
echo "-------------------------------------------------------------------------------"

echo "-------------------------------------------------------------------------------"
#Taking input from user
echo "Enter start timestamp:"
read startTime
echo "Enter end timestamp:"
read endTime
echo "-------------------------------------------------------------------------------"

echo -e "\n\n-------------------------------------------------------------------------------"
echo "Print web response code filed which has given timestamp:"
count_filter=`cat /var/log/httpd/access.log |  grep -E "\[[0-9]*\/[a-zA-Z]*\/[0-9]*\:[0-9]*\:[0-9]*\:[0-9]*[[:space:]]\+[0-9]*\]" | awk '{print $4 $9}' | wc -l`
echo "There are $count_filter records which has response code filed which has given timestamp:"
echo "-------------------------------------------------------------------------------"
echo "TIMESTAMP               CODE"
cat /var/log/httpd/access.log |  grep -E "\[[0-9]*\/[a-zA-Z]*\/[0-9]*\:[0-9]*\:[0-9]*\:[0-9]*[[:space:]]\+[0-9]*\]" | awk '{print $4 " " $9}'
echo "-------------------------------------------------------------------------------"

echo -e "\n\n-------------------------------------------------------------------------------"
echo "Sort with count and print 4 unique response code filed which has given timestamp:"
echo "-------------------------------------------------------------------------------"
#Avoiding - urls fields as it doesn't have url format data
cat /var/log/httpd/access.log | grep -E "\[[0-9]*\/[a-zA-Z]*\/[0-9]*\:[0-9]*\:[0-9]*\:[0-9]*[[:space:]]\+[0-9]*\]" | awk '{print $9}' | grep -v '"-"' |sort | uniq -c | sort -bnr | head -n 4
echo "-------------------------------------------------------------------------------"
