#!/usr/bin/bash  


generate_random_string() {  
    local length=16  
    local random_bytes=$(head -c ${length} /dev/urandom | base64 | tr -d '\n')  
    local random_string=$(echo ${random_bytes} | fold -w ${length} | head -n 1)  
    echo "${random_string}"  
}  
    
generate_chinese_string(){
  COUNT=$1

  input_string=$(head -1 $CHINESE_WORD_LIST)

  for (( i=1; i<=COUNT; i++ )); do
    random_index=$(( RANDOM % ${#input_string} ))
    random_chinese+="${input_string:$random_index:1}"
    input_string=${input_string%${input_string:$random_index:1}}
  done
  echo "$random_chinese"
}
FILENAME_LENGTH=5
FILE_NUMBER=6
#CHARSET=UTF-8
CHARSET=GBK
CHINESE_WORD_LIST='./3500.txt'

BASEDIR='/tmp/backup'  
if [[ ! -d $BASEDIR ]]; then  
  mkdir $BASEDIR
fi
# ................................  
for (( i=1; i<=FILE_NUMBER; i++ )); do
    str=$(generate_random_string)   
    filename=$(generate_chinese_string $FILENAME_LENGTH)    
    if [[ $CHARSET != "UTF-8" ]];then
      filename=$(echo $filename | iconv -c -f UTF-8 -t $CHARSET)
    fi
    num=$RANDOM
    echo $str  > "${BASEDIR}/${filename}_${num}"  
    echo "${str} > ${BASEDIR}/${filename}_${num}"  
done

  
echo "Files created successfully."
