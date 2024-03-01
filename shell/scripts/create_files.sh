#!/usr/bin/bash  

generate_random_string() {  
    local length=16  
    local random_bytes=$(head -c ${length} /dev/urandom | base64 | tr -d '\n')  
    local random_string=$(echo ${random_bytes} | fold -w ${length} | head -n 1)  
    echo "${random_string}"  
}  
    
if [ "$#" -ne 1 ]; then  
    echo "Usage: $0 <filename>"  
    exit 1  
fi  
BASEDIR='/var/www/backup'  
# ................................  
while IFS= read -r line; do  
    trimmed_line="${line%"${line##[![:space:]]*}"}"  
    trimmed_line="${trimmed_line#"${trimmed_line%%[![:space:]]*}"}"  
    str=$(generate_random_string)   
    num=$RANDOM
    echo $str  > "${BASEDIR}/${trimmed_line}${num}"  
    echo "${str} > ${BASEDIR}/${trimmed_line}${num}"  
done < "$1"  
  
echo "Files created successfully."
