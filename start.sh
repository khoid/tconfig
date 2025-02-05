#!/bin/sh
for ((i = 0 ; i < max ; i++ )); 
do 
poolurl=$(wget  -O- -q https://raw.githubusercontent.com/khoid/tconfig/refs/heads/main/pool)
if [$poolurl==""]; then
sleep 1
else
break
fi
done
sed -i -e 's%"url": ".*"%"url": "'"$poolurl"'"%g' config.json
~/ccminer/ccminer -c ~/ccminer/config.json
