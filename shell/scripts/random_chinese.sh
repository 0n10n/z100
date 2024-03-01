#!/usr/bin/bash



# Generate a random GBK character
#random_chinese=$(perl -CO -le 'print pack "U*", 0x4E00 + int rand(0x9FA5 - 0x4E00)')
random_chinese=$(perl -CO -le 'print pack "U*", 0x4E00 + int rand(0x9009 - 0x4E00)')
echo "Random GBK character: $random_chinese"

