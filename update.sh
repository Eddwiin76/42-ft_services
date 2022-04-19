#!/bin/sh

CHANGE=""
ALL=""
FTPS=""
PHPMYADMIN=""
WORDPRESS=""
GRAFANA=""
INFLUXDB=""
NGINX=""
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

while getopts "afmpwgin" opt; do
	case $opt in
		a) ALL=1;;
		f) FTPS=1;;
		m) MYSQL=1;;
		p) PHPMYADMIN=1;;
		w) WORDPRESS=1;;
		g) GRAFANA=1;;
		i) INFLUXDB=1;;
		n) NGINX=1;;
		esac
done

# Use the docker daemon from minikube.
eval $(minikube docker-env)

if [ $ALL ]
then
	kubectl delete all --all
	kubectl delete pvc --all
fi

if [ $MYSQL ]
then
	docker build -t my_mysql srcs/mysql &
	kubectl delete -f srcs/mysql/srcs/mysql.yaml
	kubectl apply -f srcs/mysql/srcs/mysql.yaml
	CHANGE=1
fi

if [ $PHPMYADMIN ]
then
	kubectl delete -f srcs/phpmyadmin/srcs/phpmyadmin.yaml &
	docker build -t my_phpmyadmin srcs/phpmyadmin
	kubectl apply -f srcs/phpmyadmin/srcs/phpmyadmin.yaml
	CHANGE=1
fi

if [ $WORDPRESS ]
then
	kubectl delete -f srcs/wordpress/srcs/wordpress.yaml &
	docker build -t my_wordpress srcs/wordpress
	kubectl apply -f srcs/wordpress/srcs/wordpress.yaml
	CHANGE=1
fi

if [ $GRAFANA ]
then
	kubectl delete -f srcs/grafana/srcs/grafana.yaml &
	docker build -t my_grafana srcs/grafana
	kubectl apply -f srcs/grafana/srcs/grafana.yaml
	CHANGE=1
fi

if [ $INFLUXDB ]
then
	docker build -t my_influxdb srcs/influxdb &
	kubectl delete -f srcs/influxdb/srcs/influxdb.yaml
	kubectl apply -f srcs/influxdb/srcs/influxdb.yaml
	CHANGE=1
fi

if [ $NGINX ]
then
	kubectl delete -f srcs/nginx/srcs/nginx.yaml &
	docker build -t my_nginx srcs/nginx
	kubectl apply -f srcs/nginx/srcs/nginx.yaml
	CHANGE=1
fi

if [ $FTPS ]
then
	kubectl delete -f srcs/FTPs/srcs/ftps.yaml &
	docker build -t my_ftps srcs/FTPs
	kubectl apply -f srcs/FTPs/srcs/ftps.yaml
	CHANGE=1
fi

if [ $CHANGE ]
then
	exit
fi

# Build docker images
mkdir logs
echo "Build images in progress..."
docker build -t my_nginx srcs/nginx > logs/nginx.log && echo $GREEN[✓]$NC Nginx &
docker build -t my_wordpress srcs/wordpress > logs/wordpress.log && echo $GREEN[✓]$NC Wordpress &
docker build -t my_mysql srcs/mysql > logs/mysql.log && echo $GREEN[✓]$NC Mysql &
docker build -t my_phpmyadmin srcs/phpmyadmin > logs/phpmyadmin.log && echo $GREEN[✓]$NC Phpmyadmin &
docker build -t my_grafana srcs/grafana > logs/grafana.log && echo $GREEN[✓]$NC Grafana &
docker build -t my_influxdb srcs/influxdb > logs/influxdb.log && echo $GREEN[✓]$NC Influxdb &
docker build -t my_ftps srcs/FTPs > logs/ftps.log && echo $GREEN[✓]$NC FTPs && wait
echo "Build images done !"

echo "Deployements in progress..."
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml > logs/Deployements
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml >> logs/Deployements
kubectl apply -f srcs/metallb/metalLB.yaml >> logs/Deployements
kubectl apply -f srcs/nginx/srcs/nginx.yaml >> logs/Deployements
kubectl apply -f srcs/wordpress/srcs/wordpress.yaml >> logs/Deployements
kubectl apply -f srcs/mysql/srcs/mysql.yaml >> logs/Deployements
kubectl apply -f srcs/phpmyadmin/srcs/phpmyadmin.yaml >> logs/Deployements
kubectl apply -f srcs/grafana/srcs/grafana.yaml >> logs/Deployements
kubectl apply -f srcs/influxdb/srcs/influxdb.yaml >> logs/Deployements
kubectl apply -f srcs/FTPs/srcs/ftps.yaml >> logs/Deployements
echo "Deployements done !"
