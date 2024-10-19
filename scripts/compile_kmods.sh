#!/bin/bash

# 定义内核模块目录
KERNEL_DIR="package/kernel/linux"

# 检查内核模块目录是否存在
if [ ! -d "$KERNEL_DIR" ]; then
  echo "Error: Directory $KERNEL_DIR does not exist."
  exit 1
fi

# 编译内核模块
echo "Compiling kernel modules..."
if ! make V=s ./package/kernel/linux/{clean,compile}; then
  echo "Error: Failed to compile kernel modules."
  exit 1
fi

echo "All modules compiled successfully."
