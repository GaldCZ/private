#!/bin/bash

LOG_FILE="/var/www/html/massage.txt"

tel_mac=$(arp-scan --localnet | grep 8c:25:05:ca:f3:a6)
pc_mac=$(arp-scan --localnet | grep 30:9c:23:07:a1:0c)


if [[ -n $tel_mac  ]] && [[ -z $pc_mac  ]] ; then 
	echo "Welcome Home Sir $(date +%F_%H:%M) \n PC started" >> $LOG_FILE
	wakeonlan 30:9c:23:07:a1:0c
	echo "PC booting $(date +%F_%H:%M)"
	espeak -s 125 -v en+f4 'Welcome Home Sir, your PC is booting!'
fi

if [[ -z $tel_mac  ]] && [[ -z $pc_mac  ]] ; then 
     
        if ping -c 1 -W 1 "192.168.0.92"; then
            echo "phone is alive, PC is booting $(date +%F_%H:%M)" >> $LOG_FILE
            wakeonlan 30:9c:23:07:a1:0c
            espeak -s 125 -v en+f4 'Welcome Home Sir, your PC is booting!'
        else
            echo "I miss you Sir $(date +%F_%H:%M)" >> $LOG_FILE
            echo "PC and phone are offline $(date +%F_%H:%M)" 
        fi         
fi

if [[ -z $tel_mac  ]] && [[ -n $pc_mac  ]] ; then 
        
        if ping -c 1 -W 1 "192.168.0.92"; then
            echo "How can i help you? $(date +%F_%H:%M)" >> $LOG_FILE
            echo "PC & tel online $(date +%F_%H:%M)"

        else
            echo "I am sorry Sir I cant see your phone $(date +%F_%H:%M)" >> $LOG_FILE
        fi 
           
fi

if [[ -n $tel_mac  ]] && [[ -n $pc_mac  ]] ; then
  
            echo "How can i help you? $(date +%F_%H:%M)" >> $LOG_FILE
            echo "PC & tel online $(date +%F_%H:%M)"
fi
