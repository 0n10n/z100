#!/usr/bin/bash 

  

input_string=$(head -1 ./3500.txt)
  
for ((i=0; i<10; i++)); do  
          random_index=$(( RANDOM % ${#input_string} ))  
          result_string+="${input_string:$random_index:1}"  
          input_string=${input_string%${input_string:$random_index:1}}  
done  
echo "$result_string"
