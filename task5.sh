#!/bin/bash

echo "-------------------------------------------------------------------------------"
echo "View /var/log/httpd/access.log"
count=`cat /var/log/httpd/access.log | wc -l`
echo "/var/log/httpd/access.log has $count line in the file. hence printing last 15 lines."
echo "-------------------------------------------------------------------------------"
tail -15 /var/log/httpd/access.log
echo "-------------------------------------------------------------------------------"

echo -e "\n\n-------------------------------------------------------------------------------"
echo "Print filed which has urls data:"
#Avoiding - urls fields as it doesn't have url format data
count_filter=`cat /var/log/httpd/access.log | awk '{print $11}' | grep -v '"-"' | wc -l`
echo "There are $count_filter records which has urls data:"
echo "-------------------------------------------------------------------------------"
cat /var/log/httpd/access.log | awk '{print $11}' | grep -v '"-"'
echo "-------------------------------------------------------------------------------"

echo -e "\n\n-------------------------------------------------------------------------------"
echo "Sort ulrs with count and print 4 unique urls"
echo "-------------------------------------------------------------------------------"
#Avoiding - urls fields as it doesn't have url format data
cat /var/log/httpd/access.log | awk '{print $11}' | grep -v '"-"' |sort | uniq -c | sort -bnr | head -n 4
echo "-------------------------------------------------------------------------------"
