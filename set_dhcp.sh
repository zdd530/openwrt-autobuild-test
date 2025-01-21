#!/bin/sh

# 设置 LAN 口的 DHCP 为关闭状态
set_dhcp_off() {
    # 修改 /etc/config/network 文件
    sed -i "/config interface 'lan'/a \        option dhcp_ignore '1'" package/base-files/files/etc/config/network

    # 修改 /etc/config/dhcp 文件
    sed -i "/config dhcp 'lan'/a \        option ignore '1'" package/network/services/dnsmasq/files/dhcp.conf

    echo "LAN 口的 DHCP 服务已设置为默认关闭。"
}

# 调用函数
set_dhcp_off
