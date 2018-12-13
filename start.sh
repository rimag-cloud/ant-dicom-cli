#!/bin/bash

if [ -f "/opt/ipc/main.py" ];then
  echo "wait serivce starting..."
  sleep 10
  python /opt/ipc/main.py
else
  echo "/opt/ipc/main.py not found!!!"
fi