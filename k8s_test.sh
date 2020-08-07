#!/bin/bash

check_system () {

        docker=$(systemctl status docker | grep Active: | awk {'print $2'})
        if [[ $docker == "active" ]]; then
                echo "INFO: Docker is running"
        else
                echo "ERROR: Docker is not running"
        fi

        kubelet=$(systemctl status kubelet | grep Active: | awk {'print $2'})
        if [[ $docker == "active" ]]; then
                echo "INFO: kubelet is running"
        else
                echo "ERROR: kubelet is not running"
        fi

}

kubernetes_ekg () {

        config_file=/etc/kubernetes/admin.conf
        if [ -f "$config_file" ]; then
            echo "INFO: Admin config_file exists."


        else
            echo "ERROR: $FILE does not exist."
                exit 1
        fi

        if ! [ -x "$(command -v kubectl)" ]; then
                echo 'ERROR: kubectl is not installed.' >&2
                exit 1
        else
                echo "INFO: kubectl is installed"
        fi


}

kubernetes_autopsy () {
        nodes=$(kubectl --kubeconfig $config_file get nodes | grep -v "NAME")

        names=$(echo "$nodes" | awk '{print $1}')

        for name in $names; do
                status=$(echo $nodes | grep $name | awk '{print $2}')
                if [[ $status == "NotReady" ]]; then
                        echo "ERROR: node $name not ready"
                else
                        echo "INFO: node $name is healthy"
                fi
        done

        pods=$(kubectl --kubeconfig $config_file get pods -n kube-system | grep -v "NAME" | grep "0/1" | awk '{print $1}')

        if [[ $pods > 1 ]]; then
                 for pod in $pods; do
                        #statements
                        echo "ERROR: Unhealthy pod $pod"
                 done
        else
                echo "INFO: all kube-system pods are healthy"
        fi




}


check_system
kubernetes_ekg
kubernetes_autopsy
