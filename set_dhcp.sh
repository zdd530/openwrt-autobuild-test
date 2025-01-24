#!/bin/sh

# 设置 LAN 口的 DHCP 为关闭状态
set_dhcp_off() {
    sed -i "/config dhcp lan/,/^[[:space:]]*$/ {/^[[:space:]]*$/i\	option ignore	1}" $GITHUB_WORKSPACE/openwrt/package/network/services/dhcp/files/dhcp.conf
    echo "LAN 口的 DHCP 服务已设置为默认关闭。"
}

# 调用函数
set_dhcp_off
