#!/bin/bash

create_files() {
    local num_files=$1
    for ((i=1; i<=num_files; i++)); do
        touch "$i.tmp"
    done
}

delete_files() {
    local num_files=$1
    for ((i=1; i<=num_files; i++)); do
        rm -f "$i.tmp"
    done
}

if [ "$#" -ne 1 ]; then
    echo "Использование: $0 <количество_файлов>"
    exit 1
fi

num_files=$1

if ! [[ "$num_files" =~ ^[0-9]+$ ]]; then
    echo "Ошибка: аргумент должен быть числом"
    exit 1
fi

create_files "$num_files"
echo "Создано $num_files файлов"

delete_files "$num_files"
echo "Удалено $num_files файлов"

