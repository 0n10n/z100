#!/usr/bin/bash

set -x
pskill()
{
 local pid
 pid=$(ps -ax | grep $1 | grep -v grep | gawk '{ print $1 }')
 echo -n "killing $1 (process $pid)..."
 kill -9 $pid
 echo "slaughtered."
}

pskill $1
