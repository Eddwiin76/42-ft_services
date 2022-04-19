FROM	alpine

RUN		apk update
RUN		apk add nginx openssl php7 php7-fpm php7-mysqli php7-json telegraf

RUN		mkdir -p /run/nginx
RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xzvf latest.tar.gz -C /var/www/
RUN		rm latest.tar.gz

ADD		srcs/telegraf.conf			/etc/telegraf/telegraf.conf
ADD		srcs/nginx.conf				/etc/nginx/
ADD		srcs/ssl_params.conf 		/etc/nginx/snippets/ssl_params.conf
ADD		srcs/wp-config.php			/var/www/wordpress
ADD		srcs/index.php				/usr/share/nginx

ADD		srcs/start.sh				/usr/bin/
RUN		chmod 755		/usr/bin/start.sh

EXPOSE	5050

ENTRYPOINT	start.sh
