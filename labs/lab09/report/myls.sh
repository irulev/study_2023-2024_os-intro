#!/bin/bash

print_file_info() {
    local file=$1
    if [ -e "$file" ]; then
        local perms=$(stat -c "%a" "$file")
        local owner=$(stat -c "%U" "$file")
        local group=$(stat -c "%G" "$file")
        local size=$(stat -c "%s" "$file")
        local mtime=$(stat -c "%y" "$file")

        echo "${perms} ${owner}:${group} ${size} ${mtime} ${file}"
    else
        echo "Error: $file does not exist"
    fi
}

print_dir_info() {
    local dir=$1
    if [ -e "$dir" ]; then
        echo "Directory: $dir"
        for file in "$dir"/*; do
            if [ -e "$file" ]; then
                if [ -d "$file" ]; then
                    print_dir_info "$file"
                else
                    print_file_info "$file"
                fi
            fi
        done
    else
        echo "Error: $dir does not exist"
    fi
}

if [ $# -eq 0 ]; then
    print_dir_info "."
else
    for arg in "$@"; do
        if [ -d "$arg" ]; then
            print_dir_info "$arg"
        else
            print_file_info "$arg"
        fi
    done
fi