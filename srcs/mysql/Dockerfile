FROM	alpine

RUN		apk update
RUN		apk add sudo mariadb mariadb-client openrc telegraf

ADD		srcs/telegraf.conf			/etc/telegraf/telegraf.conf
ADD		srcs/db_wordpress.sql		/

ADD		srcs/start.sh				/usr/bin/
RUN		chmod 755					/usr/bin/start.sh

EXPOSE 3306

ENTRYPOINT	start.sh
