#!/bin/sh

# 设置 LAN 口的 DHCP 为关闭状态
set_dhcp_off() {
    DHCP_CONF_PATH="/package/network/services/dnsmasq/files/dhcp.conf"
    
    # 打印实际路径
    echo "DHCP 配置文件路径: $DHCP_CONF_PATH"
    
    # 检查文件是否存在
    if [ ! -f "$DHCP_CONF_PATH" ]; then
        echo "错误: 找不到 DHCP 配置文件 $DHCP_CONF_PATH"
        exit 1
    fi
    
    # 使用 sed 修改配置文件
    sed -i "/config dhcp lan/,/^[[:space:]]*$/ {/^[[:space:]]*$/i\\	option ignore	1}" "$DHCP_CONF_PATH"
    echo "LAN 口的 DHCP 服务已设置为默认关闭。"
}

# 调用函数
set_dhcp_off
