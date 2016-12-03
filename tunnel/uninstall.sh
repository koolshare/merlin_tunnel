#!/bin/sh

MODULE=tunnel
killall tunnel >/dev/null 2>&1
sh /koolshare/scripts/
rm -f /koolshare/bin/tunnel
rm -f /koolshare/scripts/config-tunnel.sh
rm -f /koolshare/webs/Module_tunnel.asp
rm -f /koolshare/init.d/S90tunnel.sh
