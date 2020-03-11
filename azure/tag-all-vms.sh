#!/bin/bash
#set -ex

SUB_IDS=$(az account list -o yaml | grep id | awk {'print $2'})

for sid in ${SUB_IDS};do
        echo "subscription: $sid"
        VMS=$(az vm list --subscription $sid -o yaml | grep vmId | awk {'print $2'})

        for vm in ${VMS};do

                #echo az vm list --subscription $sid -o json | jq -c '.[] | select( .vmId == '\"$vm\"' )' | jq .resourceGroup
                DATA=$(az vm list --subscription $sid -o json | jq -c '.[] | select( .vmId == '\"$vm\"' )')
                GROUP=$(echo $DATA | jq .resourceGroup)
                NAME=$(echo $DATA | jq .name)
                echo "  VMko: $vm - $GROUP - $NAME"
                #az vm set -g MyRG -n MyVM --set-tag Display="Home Office" Owner=Accounting
                #az vm list --subscription SUB_ID -o json | jq -c '.[] | select( .vmId == "xxxxxxxxxxx-413ecead4eb3" )'

        done

done


#az account list | grep id
#az vm list --subscription xxxxxxxxxxxxxxxxxxxx | grep vmId
