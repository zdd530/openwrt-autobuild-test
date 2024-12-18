#!/bin/sh
# shellcheck disable=SC2086,SC3043,SC2164,SC2103,SC2046,SC2155

rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/applications/luci-app-openclash
rm -rf feeds/luci/applications/luci-app-passwall

# remove_unwanted_packages() {
#    local luci_packages=(
#        "luci-app-passwall" "luci-app-smartdns" "luci-app-ddns-go" "luci-app-rclone"
#        "luci-app-ssr-plus" "luci-app-vssr" "luci-theme-argon" "luci-app-daed" "luci-app-dae"
#        "luci-app-alist" "luci-app-argon-config" "luci-app-homeproxy" "luci-app-haproxy-tcp"
#        "luci-app-openclash" "luci-app-mihomo"
#    )
#    local packages_net=(
#        "haproxy" "xray-core" "xray-plugin" "dns2tcp" "dns2socks" "alist" "hysteria"
#        "smartdns" "mosdns" "adguardhome" "ddns-go" "naiveproxy" "shadowsocks-rust"
#        "sing-box" "v2ray-core" "v2ray-geodata" "v2ray-plugin" "tuic-client"
#        "chinadns-ng" "ipt2socks" "tcping" "trojan-plus" "simple-obfs"
#        "shadowsocksr-libev" "dae" "daed" "mihomo"
#    )
#    local small8_packages=(
#        "ppp" "firewall" "dae" "daed" "daed-next" "libnftnl" "nftables" "dnsmasq"
#    )
#
#    for pkg in "${luci_packages[@]}"; do
#        \rm -rf ./feeds/luci/applications/$pkg
#        \rm -rf ./feeds/luci/themes/$pkg
#    done

 #   for pkg in "${packages_net[@]}"; do
 #       \rm -rf ./feeds/packages/net/$pkg
 #   done

#   for pkg in "${small8_packages[@]}"; do
#        \rm -rf ./feeds/small8/$pkg
#    done

#    if [[ -d ./package/istore ]]; then
#        \rm -rf ./package/istore
#    fi
# }

# install_feeds() {
#    ./scripts/feeds update -i
#    for dir in ./feeds/*; do
#        # 检查是否为目录并且不以 .tmp 结尾，并且不是软链接
#        if [ -d "$dir" ] && [[ ! "$dir" == *.tmp ]] && [ ! -L "$dir" ]; then
#            if [[ $(basename "$dir") == "small8" ]]; then
#                install_small8
#            else
#                ./scripts/feeds install -f -ap $(basename "$dir")
#            fi
#        fi
#    done
# }

install_small8() {
    ./scripts/feeds install -p small8 -f  luci-app-passwall mosdns luci-app-openclash luci-app-poweroff
 }


# remove_unwanted_packages
install_small8

