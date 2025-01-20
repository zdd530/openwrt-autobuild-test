#!/bin/bash
source /etc/profile
BASE_PATH=$(cd $(dirname $0) && pwd)
mkdir -p ./feeds/utils/v2dat/patches
cp -f $BASE_PATH/patches/500-fix_v2dat.patch ./feeds/utils/v2dat/patches
