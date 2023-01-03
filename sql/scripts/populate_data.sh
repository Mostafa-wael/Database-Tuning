#!/bin/bash
set -e
# This script should accept a single argument, the size of the data to generate with initial values of 1k.
size=$1
# it should check the size argument is valid, and exit with an error if it is not.
if [ "$size" != "1k" ] && [ "$size" != "10k" ] && [ "$size" != "100k" ] && [ "$size" != "1m" ] && [ "$size" != "10m" ]; then
    echo "Invalid size argument. Please use 1k, 10k, 100k, 1m or 10m."
    exit 1
fi
# Run this command to generate the data:
psql -U postgres -a -f /mnt/dummyData/$size.sql

