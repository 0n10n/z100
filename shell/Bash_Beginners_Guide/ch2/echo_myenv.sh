#!/bin/bash
# Exercise ch2-1 from "Bash Beginners Guide" 
# Write a script using your favorite editor. The script should display the path to your homedirectory and the terminal type that you are using. Additionally it shows all the services started up in runlevel 3 on your system

#For debug purpose:
#set -x 

echo ${USER}\'s home directory is: $HOME
echo Current TERM is : $TERM
for i in ` find  /etc/rc3.d/ -name S*`; do
  
  echo Service[$((++c))]: ${i:13}
done
