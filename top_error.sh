#!/bin/bash

set -e 

#Accept the path to a log file as a command-line argument

Log_file_path=$1

# Exit with a clear error message if no argument is provided

if [ $# -eq 0 ]
then
        echo "Please provide log file path"
        exit 1
fi

#Exit with a clear error message if the file doesn't exist

if [ ! -f "$Log_file_path" ]
then
        echo "file not exits"
        exit 1
fi


<<comment
Extract all lines containing ERROR
Identify the top 5 most common error messages
Display them with their occurrence count, sorted in descending order
comment


echo "Top 5 Error"
grep "ERROR" "$Log_file_path" | awk '{ print $4,$5,$6}' | sort | uniq -c | sort -nrk1 |head -5

