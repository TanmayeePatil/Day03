#!/bin/bash

echo "-------------------------------------------------------------------------------"
echo "View /var/log/httpd/access.log"
count=`cat /var/log/httpd/access.log | wc -l`
echo "/var/log/httpd/access.log has $count line in the file. hence printing last 15 lines."
echo "-------------------------------------------------------------------------------"
tail -15 /var/log/httpd/access.log
echo "-------------------------------------------------------------------------------"

echo -e "\n\n-------------------------------------------------------------------------------"
echo "Print filed which has Client IPs:"
#Avoiding - urls fields as it doesn't have url format data
count_filter=`cat /var/log/httpd/access.log | awk 'NF>1{print $NF}' | wc -l`
echo "There are $count_filter records which has client IP data:"
echo "-------------------------------------------------------------------------------"
cat /var/log/httpd/access.log | awk 'NF>1{print $NF}' 
echo "-------------------------------------------------------------------------------"

echo -e "\n\n-------------------------------------------------------------------------------"
echo "Sort client IPs with count and print 4 unique urls"
echo "-------------------------------------------------------------------------------"
cat /var/log/httpd/access.log | awk 'NF>1{print $NF}' | sort | uniq -c | sort -bnr | head -n 4 | sed 's/\"/ /g'
echo "-------------------------------------------------------------------------------"


echo -e "\n\n-------------------------------------------------------------------------------"
echo "Sort client IPs with count and print 10 unique urls"
echo "-------------------------------------------------------------------------------"
cat /var/log/httpd/access.log | awk 'NF>1{print $NF}' | sort | uniq -c | sort -bnr | head -n 10 | sed 's/\"/ /g'
echo "-------------------------------------------------------------------------------"
