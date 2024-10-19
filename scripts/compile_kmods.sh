#!/bin/bash

KERNEL_DIR="package/kernel/linux/modules"
for d in "$KERNEL_DIR"/*; do
  if [[ -d "$d" ]]; then
    echo "Compiling $d..."
    pushd "$d" &>/dev/null
    make -j$(nproc) compile V=s
    popd &>/dev/null
  fi
done
