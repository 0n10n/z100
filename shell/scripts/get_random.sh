random_str() {  
    local length=$1  
    local chars='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'  
    local random_str=''  
    local i  
  
    for ((i=0; i<$length; i++)); do  
        random_str+="${chars:RANDOM%${#chars}:1}"  
    done  
  
    echo "$random_str"  
}  
  
# 使用函数，生成长度为10的随机字符串  
random_str_10=$(random_str 10)  