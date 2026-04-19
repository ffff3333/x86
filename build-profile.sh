#!/bin/bash
# build-profile.sh - OpenWrt 25.12 x86_64 VM Soft Router 专用配置
# 包含分区大小设置（适合虚拟机使用）

cat >> .config << 'EOF'
# ==================== Target ====================
CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_DEVICE_generic=y

# ==================== 分区大小设置（重点）===================
CONFIG_TARGET_KERNEL_PARTSIZE=512          # Boot + Kernel 分区（MB）
CONFIG_TARGET_ROOTFS_PARTSIZE=2048         # Root 分区（MB）——推荐 1024（1GB）

# ==================== LuCI ====================
CONFIG_PACKAGE_luci=y
CONFIG_LUCI_LANG_zh_Hans=y
CONFIG_PACKAGE_luci-compat=y
CONFIG_PACKAGE_luci-lib-jsonc=y
CONFIG_PACKAGE_luci-lib-ipkg=y

# ==================== Passwall2 ====================
CONFIG_PACKAGE_luci-app-passwall2=y
CONFIG_PACKAGE_geoview=y
CONFIG_PACKAGE_v2ray-geoip=y
CONFIG_PACKAGE_v2ray-geosite=y
CONFIG_PACKAGE_tcping=y
CONFIG_PACKAGE_resolveip=y
CONFIG_PACKAGE_unzip=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_ip-full=y
CONFIG_PACKAGE_coreutils=y
CONFIG_PACKAGE_coreutils-base64=y
CONFIG_PACKAGE_coreutils-nohup=y

CONFIG_PACKAGE_xray-core=y
CONFIG_PACKAGE_sing-box=y
CONFIG_PACKAGE_hysteria=y
CONFIG_PACKAGE_chinadns-ng=y

# ==================== OpenClash ====================
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_dnsmasq-full=y
CONFIG_PACKAGE_ipset=y
CONFIG_PACKAGE_kmod-tun=y

# ==================== 安全与净化 ====================
CONFIG_PACKAGE_banip=y
CONFIG_PACKAGE_luci-app-banip=y
CONFIG_PACKAGE_adblock-fast=y
CONFIG_PACKAGE_luci-app-adblock-fast=y

# ==================== 虚拟化与软路由优化 ====================
CONFIG_PACKAGE_qemu-guest-agent=y
CONFIG_PACKAGE_kmod-virtio=y
CONFIG_PACKAGE_kmod-virtio-net=y
CONFIG_PACKAGE_kmod-virtio-block=y
CONFIG_PACKAGE_kmod-virtio-pci=y

# ==================== 网络加速 ====================
CONFIG_PACKAGE_kmod-nft-offload=y
CONFIG_PACKAGE_kmod-nft-flow=y
CONFIG_PACKAGE_sqm-scripts=y
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_tc=y
CONFIG_PACKAGE_kmod-sched-cake=y
CONFIG_PACKAGE_kmod-sched-fq_codel=y

CONFIG_PACKAGE_irqbalance=y
CONFIG_PACKAGE_kmod-packet-steering=y

# ==================== 磁盘与文件系统 ====================
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-exfat=y
CONFIG_PACKAGE_kmod-fs-ntfs3=y
CONFIG_PACKAGE_block-mount=y
CONFIG_PACKAGE_kmod-usb-storage=y

# ==================== 其他常用 ====================
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-smartdns=y

# ==================== 构建优化 ====================
CONFIG_CCACHE=y
CONFIG_ALL_NONSHARED=n
CONFIG_ALL_KMODS=n
CONFIG_SIGNED_PACKAGES=n
CONFIG_AUTOREMOVE=y
EOF

make defconfig

echo "build-profile.sh 执行完成！"
echo "已设置分区大小：Kernel = 128MB，Rootfs = 1024MB (1GB)"
echo "生成的 ext4-combined.img 会直接带有较大 root 分区，适合 VM 使用。"
echo "提示：如果以后需要调整大小，直接修改上面的两个 CONFIG_TARGET_xxx_PARTSIZE 值并重新编译即可。"
