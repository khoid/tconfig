#!/bin/sh
poolurl=$(wget  -O- -q https://raw.githubusercontent.com/khoid/tconfig/refs/heads/main/pool)
sed -i -e 's%"url": ".*"%"url": "'"$poolurl"'"%g' config.json
~/ccminer/ccminer -c ~/ccminer/config.json
