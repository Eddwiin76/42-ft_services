#!/bin/sh

# Start minikube
# minikube start --cpus 6 --memory 6144
minikube start

# Start Dashboard
minikube addons enable dashboard
terminator -T "dashboard" -e "minikube dashboard"

./update.sh

# Setup metalLB secret.
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" >> logs/Deployements

firefox https://172.17.0.9/

echo "Enjoy !!"
