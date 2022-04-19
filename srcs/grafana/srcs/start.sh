#!/bin/sh

telegraf &
cd /usr/share/grafana && /usr/sbin/grafana-server --config=/etc/grafana.ini
