#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <file_extension>"
    exit 1
fi

directory=$1
file_extension=$2

count=$(find "$directory" -type f -name "*.$file_extension" | wc -l)

echo "Number of files with extension .$file_extension in $directory: $count"