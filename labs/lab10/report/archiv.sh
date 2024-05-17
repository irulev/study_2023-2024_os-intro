#!/bin/bash

directory_path="/path/to/directory"

if [ ! -f archive.tar ]; then
    touch archive.tar
fi

find $directory_path -type f -mtime -7 -exec tar -rvf archive.tar {} \;

