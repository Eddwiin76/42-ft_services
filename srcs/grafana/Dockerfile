FROM	alpine

RUN		apk update
RUN		apk add grafana telegraf

ADD		srcs/telegraf.conf			/etc/telegraf/telegraf.conf
COPY	srcs/grafana.db				/usr/share/grafana/data/grafana.db

ADD		srcs/start.sh				/usr/bin/
RUN		chmod 755					/usr/bin/start.sh

EXPOSE	3000

ENTRYPOINT	start.sh
