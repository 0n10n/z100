给变量设置一个如果变量未赋值时的默认值

CMD=${CMD:='startup'} 

### 循环的写法

#### 第一种
```
SERVICE_NAME=(api ess collect registry ras-cluster)
loop() {
    echo "Clean RCS service."

    for service in "${SERVICE_NAME[@]}"
    do
        echo $service
    done
    

}

loop
```
#### 第二种
```
echo "######"
echo  ${SERVICE_NAME[1]}

echo "${SERVICE_NAME[@]}"
SERVICE="api     ess    collect registry ras-cluster"
for i in $SERVICE; do
    echo $i/bin
done
```

#### 常规

```
for i in `seq 1 5`;do echo $i;done  
```