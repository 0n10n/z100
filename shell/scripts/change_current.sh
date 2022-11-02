#!/usr/bin/bash

KEYWORD=foobar
BASEDIR=/var/www/html

cd $BASEDIR
latest=`ls -lt $BASEDIR |grep $KEYWORD |awk {' print $9'}|sort -r |head -n 1`
if [ -e $BASEDIR/current ]; then
	current=`ls -l current|awk {' print $11'}`
else 
	ln -s $latest current
	exit 0
fi

echo $latest
echo $current

if  [ $latest != $current ]; then
	rm -f current
	ln -s $latest current
fi


