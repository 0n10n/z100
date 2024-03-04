#!/usr/bin/bash

COUNT=1

if [ "$#" -eq 1 ]; then
  COUNT=$1
fi

# Generate a random Chinese character
#random_chinese=$(perl -CO -le 'print pack "U*", 0x4E00 + int rand(0x9FA5 - 0x4E00)')
for (( i=1; i<=COUNT; i++ )); do  
  random_chinese+="$(perl -CO -le 'print pack "U*", 0x4E00 + int rand(0x9009 - 0x4E00)')"
done
echo "Random GBK character: $random_chinese"
echo $random_chinese | iconv -c -f UTF-8 -t GBK

