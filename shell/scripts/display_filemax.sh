#!/usr/bin/bash


echo 系统最大文件句柄数：$(cat /proc/sys/fs/file-max)
echo 单个进程最大文件句柄：$(cat /proc/sys/fs/nr_open)
echo 系统已经使用的句柄数：$(cat /proc/sys/fs/file-nr |cut -f1)
max=100
ps -e | awk 'NR > 1 { print $1 }' |
while read -r pid; do
  if [ -e /proc/$pid/exe ];then
    exe_path=$(readlink /proc/$pid/exe)
  else 
    exe_path=$(cat /proc/$pid/comm)
  fi
  file_open=$(lsof -p $pid |wc -l)
  if (( file_open > max )); then
    echo 进程 $pid 打开的文件句柄数： $(lsof -p $pid|wc -l), $exe_path
  fi  
done
