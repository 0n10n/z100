#!/usr/bin/bash  

generate_random_string() {  
    local length=16  
    local random_bytes=$(head -c ${length} /dev/urandom | base64 | tr -d '\n')  
    local random_string=$(echo ${random_bytes} | fold -w ${length} | head -n 1)  
    echo "${random_string}"  
}  
    
generate_chinese_string(){
  COUNT=$1
  for (( i=1; i<=COUNT; i++ )); do
    random_chinese+="$(perl -CO -le 'print pack "U*", 0x4E00 + int rand(0x9009 - 0x4E00)')"
  done
  if [[ $CHARSET != "UTF-8" ]];then
    random_chinese=$(echo $random_chinese | iconv -c -f UTF-8 -t $CHARSET)
  fi
  echo "$random_chinese"
}
CHARSET=GBK
FILE_NUMBER=10
filename=filelist_$CHARSET.txt


BASEDIR='/tmp/backup'  
if [[ ! -d $BASEDIR ]]; then  
  mkdir $BASEDIR
fi
# ................................  
rm -f "${BASEDIR}/${filename}"  
for (( i=1; i<=FILE_NUMBER; i++ )); do
    content=$(generate_chinese_string 6)    
    echo -e "$content\r"  >> "${BASEDIR}/${filename}"  
    echo "${BASEDIR}/${filename}"  
done

  
echo "Files created successfully."
