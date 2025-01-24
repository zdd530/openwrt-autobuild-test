#!/bin/sh

# 设置 LAN 口的 DHCP 为关闭状态
set_dhcp_off() {
    sed -i "/config dhcp lan/,/^[[:space:]]*$/ {/^[[:space:]]*$/i\\	option ignore	1}" /package/network/services/dnsmasq/files/dhcp.conf
    echo "LAN 口的 DHCP 服务已设置为默认关闭。"
}

# 调用函数
set_dhcp_off
