#!/usr/bin/bash
#Depends on https://github.com/jianboy/github-host 
#crontab 0 1 * * * /root/update_hosts.sh >/dev/null 2>&1


if [ ! -d 'github-host' ]; then
  proxychains git clone git@github.com:/jianboy/github-host
fi

if [ ! -f /etc/hosts.orig ]; then
  cp /etc/hosts /etc/hosts.orig
fi

cd ${PWD}/github-host
python3 main.py
cd ..
md5sum -c github_host.md5

if [ $? -eq 0 ]; then
  echo Github Hosts文件没有变化
else 
  echo Github Hosts文件变了
  cat /etc/hosts.orig > /etc/hosts
  cat ${PWD}/github-host/hosts >> /etc/hosts 
  echo 已更新/etc/hosts文件
  md5sum github-host/hosts >github_host.md5
fi
