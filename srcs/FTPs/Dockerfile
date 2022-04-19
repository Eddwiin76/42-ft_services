FROM	alpine

RUN		apk update
RUN		apk add vsftpd openssl telegraf

ADD		srcs/vsftpd.conf			/etc/vsftpd/vsftpd.conf
ADD		srcs/telegraf.conf			/etc/telegraf/telegraf.conf

ADD		srcs/start.sh				/usr/bin/
RUN		chmod 755					/usr/bin/start.sh

EXPOSE	21 20 30020 30021

ENTRYPOINT	start.sh
