#!/bin/sh

eval `dbus export tunnel_`
source /koolshare/scripts/base.sh

onstart() {

killall tunnel || true
txt=$tunnel_txt
en=$tunnel_enable

if [ -z "$txt" ]; then
	logger "no config found"
else
	touch /tmp/tunnel.log
	echo $txt|base64_decode > /tmp/tunnel.json
	tunnel -c /tmp/tunnel.json -p /tmp/tunnel.pid -d &
fi

}

case $ACTION in
start)
	if [ "$tunnel_enable" == "1" ]; then
		logger "[软件中心]: 启动穿透DDNS！"
		killall tunnel >/dev/null 2>&1
		onstart
	else
		logger "[软件中心]: 穿透DDNS未启用！跳过！"
	fi
	;;
*)
	onstart
	;;
esac  
