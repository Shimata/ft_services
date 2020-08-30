#!/bin/sh

eval $(minikube docker-env)
kubectl delete deploy nginx  
docker build . -t nginx
kubectl apply -f /Users/wquinoa/p/ft_services/srcs/nginx-deployment.yaml
sleep 5
kubectl get pods
echo ''
sleep 2
kubectl logs $(kubectl get pods | grep nginx --exclude Terminating | cut -d ' ' -f1)