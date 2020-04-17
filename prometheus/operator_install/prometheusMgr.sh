#!/bin/bash
#
ACTION=$1
WORKDIR=/root/k8sDemo/prometheus/operator_install

if [[ $1 -eq "intall" ]];then
	cd $WORKDIR
	kubectl create -f manifests/setup
	until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
	kubectl create -f manifests/
elif [[ $1 -eq "uninstall" ]];then
	cd $WORKDIR
	kubectl delete --ignore-not-found=true -f manifests/ -f manifests/setup
else
	echo "Usage: ././prometheusMgr.sh install|unistall."
fi

