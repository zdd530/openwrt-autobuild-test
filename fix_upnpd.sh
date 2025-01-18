#!/bin/bash
source /etc/profile
BASE_PATH=$(cd $(dirname $0) && pwd)

# 修复24.10版本upnpd
fix_miniupnpd() {
    local PKG_HASH=$(awk -F"=" '/^PKG_HASH:/ {print $2}' ./feeds/packages/net/miniupnpd/Makefile)
    if [[ $PKG_HASH == "fbdd5501039730f04a8420ea2f8f54b7df63f9f04cde2dc67fa7371e80477bbe" ]]; then
        if [[ -f $BASE_PATH/patches/400-fix_nft_miniupnp.patch ]]; then
            if [[ ! -d ./feeds/packages/net/miniupnpd/patches ]]; then
                mkdir -p ./feeds/packages/net/miniupnpd/patches
            fi
            \cp -f $BASE_PATH/patches/400-fix_nft_miniupnp.patch ./feeds/packages/net/miniupnpd/patches/
        fi
    fi
}

fix_miniupnpd
