#!/bin/sh
poolurl=""
i=0
max=5
while [ $i -lt $max ]
do
poolurl=$(wget  -O- -q https://raw.githubusercontent.com/khoid/tconfig/refs/heads/main/pool)
if [ -z "$poolurl" ]
then
sleep 1
else
break
fi
true $(( i=i+1 ))
done
sed -i -e 's%"url": ".*"%"url": "'"$poolurl"'"%g' config.json
~/ccminer/ccminer -c ~/ccminer/config.json
