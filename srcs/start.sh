#!/bin/sh

export MINIKUBE_HOME=/Users/wquinoa/goinfre/.minikube;
export PATH=$MINIKUBE_HOME/bin:$PATH;
export KUBECONFIG=$MINIKUBE_HOME/.kube/config;
export KUBE_EDITOR="code -w";
export PATH=$MINIKUBE_HOME/bin:$PATH

#bash -c "bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'"
minikube start --driver=virtualbox --memory='3000' --disk-size 5000MB;
minikube addons enable metallb;
minikube addons enable dashboard;

eval $(minikube docker-env);
kubectl delete deploy nginx  
kubectl delete deploy mysql  
docker build -t nginx ./nginx/
docker build -t mysql ./mysql/
kubectl create -f nginx-deployment.yaml
kubectl create -f mysql-deployment.yaml
kubectl apply -f metallb.yaml