#!/bin/bash
# build-profile.sh - OpenWrt 25.12 x86_64 VM Soft Router 完整推荐配置（2026版）

cat >> .config << 'EOF'
# ==================== Target & 分区大小 ====================
CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_DEVICE_generic=y

CONFIG_TARGET_KERNEL_PARTSIZE=256
CONFIG_TARGET_ROOTFS_PARTSIZE=2048         # 1.5GB，适合较多插件

# ==================== LuCI 基础 ====================
CONFIG_PACKAGE_luci=y
CONFIG_LUCI_LANG_zh_Hans=y
CONFIG_PACKAGE_luci-compat=y
CONFIG_PACKAGE_luci-lib-jsonc=y
CONFIG_PACKAGE_luci-lib-ipkg=y

# ==================== 主题（Argon 需要先添加 feed） ====================
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-app-argon-config=y     # 可选：Argon 配置插件（背景、暗黑模式等）

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

# ==================== 安全与广告过滤 ====================
CONFIG_PACKAGE_banip=y
CONFIG_PACKAGE_luci-app-banip=y
CONFIG_PACKAGE_adblock-fast=y
CONFIG_PACKAGE_luci-app-adblock-fast=y
CONFIG_PACKAGE_luci-app-adguardhome=y

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

# ==================== 虚拟化 ====================
CONFIG_PACKAGE_qemu-guest-agent=y
CONFIG_PACKAGE_kmod-virtio=y
CONFIG_PACKAGE_kmod-virtio-net=y
CONFIG_PACKAGE_kmod-virtio-block=y
CONFIG_PACKAGE_kmod-virtio-pci=y

# ==================== 远程访问 ====================
CONFIG_PACKAGE_luci-app-wireguard=y
CONFIG_PACKAGE_kmod-wireguard=y
CONFIG_PACKAGE_luci-proto-wireguard=y
CONFIG_PACKAGE_luci-app-ddns=y

# ==================== 系统工具 ====================
CONFIG_PACKAGE_luci-app-attendedsysupgrade=y
CONFIG_PACKAGE_luci-app-statistics=y
CONFIG_PACKAGE_luci-app-nlbwmon=y
CONFIG_PACKAGE_luci-app-watchcat=y
CONFIG_PACKAGE_luci-app-ksmbd=y
CONFIG_PACKAGE_ksmbd=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_miniupnpd=y

# ==================== 其他常用 ====================
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_usbutils=y
CONFIG_PACKAGE_pciutils=y

# ==================== 构建优化 ====================
CONFIG_CCACHE=y
CONFIG_ALL_NONSHARED=n
CONFIG_ALL_KMODS=n
CONFIG_SIGNED_PACKAGES=n
CONFIG_AUTOREMOVE=y
EOF

make defconfig

echo "build-profile.sh 执行完成！"
echo "注意：luci-theme-argon 已保留，但必须在 diy-part1.sh 中添加 argon feed 才能正常编译。"
