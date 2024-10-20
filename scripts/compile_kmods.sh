#!/bin/bash

./staging_dir/host/bin/usign -G -s ./key-build -p ./key-build.pub -c

# 编译内核
make -j17 target/linux/{clean,compile} V=s LINUX_VERMAGIC:=00bdd56aed0992cf77d7e3c1c49495e7

# 编译内核模块
echo "Compiling kernel modules..."
make V=s LINUX_VERMAGIC:=00bdd56aed0992cf77d7e3c1c49495e7 ./package/kernel/linux/{clean,compile}

make bin/targets/ramips/mt7621/packages/index

echo "All modules that could be compiled have been compiled."
