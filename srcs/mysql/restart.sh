#!/bin/sh

eval $(minikube docker-env)
kubectl delete deploy mysql
docker build . -t mysql
kubectl apply -f /Users/wquinoa/p/ft_services/srcs/mysql-deployment.yaml
sleep 5
kubectl get pods
echo ''
sleep 1
kubectl logs $(kubectl get pods | grep mysql --exclude Terminating | cut -d ' ' -f1)