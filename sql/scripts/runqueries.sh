#!/bin/bash
set -e
script=$1

# Calculate the time it takes to run the query
start=$(date +%s.%N)
psql  -U postgres -a -f /mnt/queries/$script.sql
end=$(date +%s.%N)
runtime=(${end} - ${start})
# convert to seconds
runtime=$(echo "${runtime}" | awk '{print $1/1000}')
echo "Runtime: ${runtime} seconds"
# echo "Runtime: ${runtime} seconds" > /mnt/queries/$script.time
