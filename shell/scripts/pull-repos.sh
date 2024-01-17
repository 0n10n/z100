#!/usr/bin/bash

BASEDIR=/mnt/github

#echo find $BASEDIR -maxdepth 3 -type d -name .git
GITS=`find ${BASEDIR} -maxdepth 3 -type d -name .git`
for dir in $GITS; do
	repo=${dir:0:-5}
	pushd .
	cd $repo
	echo ${PWD}: Going to pull $repo...
	proxychains4 -f /etc/proxychains.conf git pull
	
	popd
done
