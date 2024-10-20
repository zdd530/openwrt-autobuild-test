#!/bin/bash

./staging_dir/host/bin/usign -G -s ./key-build -p ./key-build.pub -c

# 编译内核
make -j17 target/linux/{clean,compile} V=s LINUX_VERMAGIC:=00bdd56aed0992cf77d7e3c1c49495e7

# 定义内核模块目录
KERNEL_DIR="package/kernel/linux"

# 检查内核模块目录是否存在
if [ ! -d "$KERNEL_DIR" ]; then
  echo "Error: Directory $KERNEL_DIR does not exist."
  exit 1
fi

# 编译内核模块
echo "Compiling kernel modules..."
make -j$(nproc) -k LINUX_VERMAGIC:=00bdd56aed0992cf77d7e3c1c49495e7 "$KERNEL_DIR"/compile V=s

make "$KERNEL_DIR"/index

echo "All modules that could be compiled have been compiled."
