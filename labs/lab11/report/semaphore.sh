#!/bin/bash

semaphore_file="semaphore.lock"

t1=10

t2=5

# Ожидание освобождения ресурса
wait_for_resource() {
  echo "Waiting for resource to be released..."
  while [ -f "$semaphore_file" ]; do
    sleep 1
  done
  echo "Resource released, using it..."
}

# Использование ресурса
use_resource() {
  touch "$semaphore_file"
  echo "Using resource..."
  sleep $t2
  echo "Resource used, releasing it..."
  rm "$semaphore_file"
}

wait_for_resource

use_resource

# Создание файла-семафора для следующего процесса
touch "$semaphore_file"