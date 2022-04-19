FROM	alpine

RUN		apk update
RUN		apk add nginx openssl telegraf php7 php7-fpm php7-json  php7-mbstring php7-session php7-mysqli

RUN		mkdir -p /run/nginx
RUN		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN		tar -xzf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN		rm phpMyAdmin-5.0.4-all-languages.tar.gz
RUN		mv phpMyAdmin-5.0.4-all-languages /var/www/phpmyadmin
RUN		mkdir /var/www/phpmyadmin/tmp
RUN		chmod 777 /var/www/phpmyadmin/tmp

ADD		srcs/telegraf.conf			/etc/telegraf/telegraf.conf
ADD		srcs/nginx.conf			/etc/nginx/
ADD		srcs/ssl_params.conf 	/etc/nginx/snippets/ssl_params.conf
ADD		srcs/config.inc.php		/var/www/phpmyadmin

ADD		srcs/start.sh			/usr/bin/
RUN		chmod 755	/usr/bin/start.sh

EXPOSE	5000

ENTRYPOINT	start.sh
