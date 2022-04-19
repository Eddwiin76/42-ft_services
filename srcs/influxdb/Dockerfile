FROM	alpine

RUN		apk update
RUN		apk add influxdb telegraf

ADD		srcs/telegraf.conf			/etc/telegraf/telegraf.conf

ADD		srcs/start.sh				/usr/bin/
RUN		chmod 755					/usr/bin/start.sh

EXPOSE	5050

ENTRYPOINT	start.sh
