#/bin/bash

datum=$(date "+%m_%d_%y")
slozka=$(echo "/var/www/html/Motion/${datum}")

mkdir -p ${slozka}
find /var/lib/motion/ -mtime -1 -exec cp {} ${slozka} \;

FILES=$(echo /var/www/html/Motion/)

#mpack -s "Motion detection" 01-20160212013900-00.jpg pavelsuha95@gmail.com

rsync -avz -e 'ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null' ${FILES} gald@192.168.0.100:${FILES}

