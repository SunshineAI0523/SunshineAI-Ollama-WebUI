#!/bin/bash

# 工具链列表，使用英文逗号分隔
toolchains="aarch64-apple-darwin, aarch64-apple-ios, aarch64-apple-ios-macabi, aarch64-apple-ios-sim, aarch64-linux-android, aarch64-pc-windows-gnullvm, aarch64-pc-windows-msvc, aarch64-unknown-fuchsia, aarch64-unknown-linux-gnu, aarch64-unknown-linux-musl, aarch64-unknown-linux-ohos, aarch64-unknown-none, aarch64-unknown-none-softfloat, aarch64-unknown-uefi, arm-linux-androideabi, arm-unknown-linux-gnueabi, arm-unknown-linux-gnueabihf, arm-unknown-linux-musleabi, arm-unknown-linux-musleabihf, arm64ec-pc-windows-msvc, armebv7r-none-eabi, armebv7r-none-eabihf, armv5te-unknown-linux-gnueabi, armv5te-unknown-linux-musleabi, armv7-linux-androideabi, armv7-unknown-linux-gnueabi, armv7-unknown-linux-gnueabihf, armv7-unknown-linux-musleabi, armv7-unknown-linux-musleabihf, armv7-unknown-linux-ohos, armv7a-none-eabi, armv7r-none-eabi, armv7r-none-eabihf, i586-pc-windows-msvc, i586-unknown-linux-gnu, i586-unknown-linux-musl, i686-linux-android, i686-pc-windows-gnu, i686-pc-windows-gnullvm, i686-pc-windows-msvc, i686-unknown-freebsd, i686-unknown-linux-gnu, i686-unknown-linux-musl, i686-unknown-uefi, loongarch64-unknown-linux-gnu, loongarch64-unknown-linux-musl, loongarch64-unknown-none, loongarch64-unknown-none-softfloat, nvptx64-nvidia-cuda, powerpc-unknown-linux-gnu, powerpc64-unknown-linux-gnu, powerpc64le-unknown-linux-gnu, riscv32i-unknown-none-elf, riscv32im-unknown-none-elf, riscv32imac-unknown-none-elf, riscv32imafc-unknown-none-elf, riscv32imc-unknown-none-elf, riscv64gc-unknown-linux-gnu, riscv64gc-unknown-linux-musl, riscv64gc-unknown-none-elf, riscv64imac-unknown-none-elf, s390x-unknown-linux-gnu, sparc64-unknown-linux-gnu, sparcv9-sun-solaris, thumbv6m-none-eabi, thumbv7em-none-eabi, thumbv7em-none-eabihf, thumbv7m-none-eabi, thumbv7neon-linux-androideabi, thumbv7neon-unknown-linux-gnueabihf, thumbv8m.base-none-eabi, thumbv8m.main-none-eabi, thumbv8m.main-none-eabihf, wasm32-unknown-emscripten, wasm32-unknown-unknown, wasm32-wasip1, wasm32-wasip1-threads, wasm32-wasip2, wasm32v1-none, x86_64-apple-darwin, x86_64-apple-ios, x86_64-apple-ios-macabi, x86_64-fortanix-unknown-sgx, x86_64-linux-android, x86_64-pc-solaris, x86_64-pc-windows-gnu, x86_64-pc-windows-gnullvm, x86_64-pc-windows-msvc, x86_64-unknown-freebsd, x86_64-unknown-fuchsia, x86_64-unknown-illumos, x86_64-unknown-linux-gnu, x86_64-unknown-linux-gnux32, x86_64-unknown-linux-musl, x86_64-unknown-linux-ohos, x86_64-unknown-netbsd, x86_64-unknown-none, x86_64-unknown-redox, x86_64-unknown-uefi"

# 将工具链字符串转换为数组
IFS=', ' read -r -a toolchain_array <<< "$toolchains"

# 循环添加工具链
for target in "${toolchain_array[@]}"; do
    echo "Adding target: $target"
    rustup target add "$target" --toolchain stable
    if [ $? -ne 0 ]; then
        echo "Failed to add target: $target"
    else
        echo "Successfully added target: $target"
    fi
done

echo "All targets processed."
