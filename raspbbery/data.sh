#!/bin/bash
FILE="/var/www/html/data/"
#java -jar /home/jaja/DHT12_csv.jar >> ${FILE}

python /home/jaja/Dokumenty/cronMakeData/teplota_tlak_vyska.py

#scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ${FILE} gald@78.108.110.89:/var/www/html
rsync -rtv -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" ${FILE} gald@192.168.0.100:${FILE}
