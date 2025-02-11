为了在 GitHub Actions 中构建 Debian 系统的 rootfs，并使用 `debootstrap` 工具和指定的软件包，你可以按照以下步骤操作。以下是一个完整的 GitHub Actions 工作流配置文件（`.github/workflows/build-rootfs.yml`），它描述了如何完成这个任务。

```yaml
name: Build Debian RootFS

on:
  workflow_dispatch:  # 你可以根据需要触发这个工作流，例如通过手动触发

jobs:
  build-rootfs:
    runs-on: ubuntu-20.04
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Set up QEMU user mode emulator (for debootstrap)
        run: sudo apt-get update && sudo apt-get install -y qemu qemu-utils qemu-system-common debootstrap

      - name: Create working directory
        run: mkdir -p rootfs

      - name: Bootstrap Debian rootfs
        run: |
          set -e
          DEBIAN_FRONTEND=noninteractive debootstrap --variant=buildd --arch=amd64 bullseye rootfs http://deb.debian.org/debian

      - name: Install required packages
        run: |
          set -e
          chroot rootfs /bin/bash -c "
            apt-get update &&
            apt-get install -y apt-utils bash-completion bc bzip2 curl dialog diffutils findutils gnupg gnupg2 gpgsm hostname iproute2 iputils-ping keyutils language-pack-en less libcap2-bin libkrb5-3 libnss-mdns libnss-myhostname libvte-common locales lsof man-db manpages mtr ncurses-base openssh-client passwd pigz pinentry-curses procps rsync sudo tcpdump time traceroute tree tzdata unzip util-linux wget xauth xz-utils zip libgl1 libegl1-mesa libgl1-mesa-glx libegl1 libglx-mesa0 libvulkan1 mesa-vulkan-drivers git git-lfs &&
            # Special case for libvte-2.9*-common
            if apt-cache search libvte-2.9 | grep -q libvte-2.9; then
              apt-get install -y $(apt-cache search libvte-2.9 | grep -oP '(?<=libvte-2.9\d+-common)\S+')
            fi
          "

      - name: Tar the rootfs
        run: |
          cd rootfs
          sudo tar --numeric-owner -cvf ../debian-rootfs.tar .
          cd ..

      - name: Upload rootfs tarball
        uses: actions/upload-artifact@v2
        with:
          name: debian-rootfs
          path: debian-rootfs.tar
```

### 解释

1. **Checkout repository**: 检出你的仓库代码（尽管这个例子中我们并不需要仓库的代码，但这个步骤通常是标准流程的一部分）。

2. **Set up QEMU user mode emulator (for debootstrap)**: 安装 `qemu` 和 `debootstrap`，`qemu-utils` 和 `qemu-system-common` 是为了支持 `debootstrap` 在某些架构上的运行。

3. **Create working directory**: 创建一个目录来存放 rootfs。

4. **Bootstrap Debian rootfs**: 使用 `debootstrap` 创建一个 Debian Bullseye 的 rootfs。你可以根据需要更改 Debian 版本（例如 `bullseye` 为 `buster` 等）。

5. **Install required packages**: 在 chroot 环境中安装所需的软件包。注意，对于 `libvte-2.9*-common`，我们使用了一个简单的条件检查来确保如果存在合适的包，则安装它。这个检查可能需要根据实际可用版本进行调整。

6. **Tar the rootfs**: 将 rootfs 目录打包成一个 tar 文件。

7. **Upload rootfs tarball**: 将生成的 tar 文件作为构建产物上传，以便后续下载或使用。

### 注意事项

- **Debian 版本**：确保 `debootstrap` 的 URL 和版本标签（如 `bullseye`）与你想要构建的 Debian 版本相匹配。
- **包名匹配**：对于带有通配符的包名（如 `libvte-2.9*-common`），你可能需要调整脚本以匹配实际可用的包版本。
- **依赖关系**：某些包可能有依赖关系，`apt-get install -y` 会自动处理这些依赖关系。

将上述 YAML 内容保存为 `.github/workflows/build-rootfs.yml` 并推送到你的 GitHub 仓库后，你应该能够在 Actions 页面上手动触发这个工作流，并查看构建结果。
