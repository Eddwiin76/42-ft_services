FROM	alpine

RUN		apk add nginx openssl telegraf

RUN		mkdir -p /run/nginx

ADD		srcs/telegraf.conf			/etc/telegraf/telegraf.conf
ADD		srcs/nginx.conf				/etc/nginx/
ADD		srcs/ssl_params.conf 		/etc/nginx/snippets/ssl_params.conf
ADD		srcs/website/*				/var/www/

ADD		srcs/start.sh				/usr/bin/
RUN		chmod 755	/usr/bin/start.sh

EXPOSE	80 443

ENTRYPOINT	start.sh
