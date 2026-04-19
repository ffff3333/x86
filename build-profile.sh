#!/bin/bash
# build-profile.sh - OpenWrt 25.12 x86_64 + Passwall2 + OpenClash
# 包含 banip、adblock-fast、网络加速完整配置（2026 年推荐版）

cat >> .config << 'EOF'
# ==================== Target (x86_64 generic) ====================
CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_DEVICE_generic=y

# ==================== LuCI 基础 ====================
CONFIG_PACKAGE_luci=y
CONFIG_LUCI_LANG_zh_Hans=y
CONFIG_PACKAGE_luci-compat=y
CONFIG_PACKAGE_luci-lib-jsonc=y
CONFIG_PACKAGE_luci-lib-ipkg=y

# ==================== Passwall2 主程序 ====================
CONFIG_PACKAGE_luci-app-passwall2=y

# Passwall2 核心依赖
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

# 代理核心（推荐全部开启，可按需注释）
CONFIG_PACKAGE_xray-core=y
CONFIG_PACKAGE_sing-box=y
CONFIG_PACKAGE_hysteria=y
CONFIG_PACKAGE_chinadns-ng=y
# CONFIG_PACKAGE_naiveproxy=y
# CONFIG_PACKAGE_shadowsocks-rust=y

# ==================== OpenClash ====================
CONFIG_PACKAGE_luci-app-openclash=y

# OpenClash 常用依赖
CONFIG_PACKAGE_dnsmasq-full=y
CONFIG_PACKAGE_ipset=y
CONFIG_PACKAGE_kmod-tun=y

# ==================== 安全增强 ====================
# banIP（IP 封禁）
CONFIG_PACKAGE_banip=y
CONFIG_PACKAGE_luci-app-banip=y

# adblock-fast（快速广告屏蔽）
CONFIG_PACKAGE_adblock-fast=y
CONFIG_PACKAGE_luci-app-adblock-fast=y

# ==================== 网络加速与性能优化 ====================
# 流卸载（强烈推荐 x86_64 开启，提升吞吐量）
CONFIG_PACKAGE_kmod-nft-offload=y
CONFIG_PACKAGE_kmod-nft-flow=y

# Software Flow Offloading
CONFIG_PACKAGE_firewall4=y
# CONFIG_FIREWALL4_FLOW_OFFLOADING=y   # 在 firewall defaults 中通过 uci 开启更可靠

# SQM（缓冲膨胀控制，推荐 Cake）
CONFIG_PACKAGE_sqm-scripts=y
CONFIG_PACKAGE_luci-app-sqm=y
CONFIG_PACKAGE_tc=y
CONFIG_PACKAGE_kmod-sched-cake=y
CONFIG_PACKAGE_kmod-sched-fq_codel=y

# 多核优化
CONFIG_PACKAGE_irqbalance=y
CONFIG_PACKAGE_kmod-packet-steering=y

# ==================== x86 常用增强 ====================
CONFIG_PACKAGE_kmod-fs-exfat=y
CONFIG_PACKAGE_kmod-fs-ntfs3=y
CONFIG_PACKAGE_kmod-usb-storage=y
CONFIG_PACKAGE_block-mount=y
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-smartdns=y

# ==================== 构建优化 ====================
CONFIG_CCACHE=y
CONFIG_ALL_NONSHARED=n
CONFIG_ALL_KMODS=n
CONFIG_SIGNED_PACKAGES=n
CONFIG_AUTOREMOVE=y
EOF

# 执行 defconfig
make defconfig

echo "build-profile.sh 执行完成！已包含 Passwall2 + OpenClash + banip + adblock-fast + 网络加速配置。"
echo "建议编译后，在 LuCI 中额外配置："
echo "  - Network → Firewall → 开启 Software flow offloading"
echo "  - Services → SQM QoS → 配置下载/上传带宽（建议实际带宽的 85-95%）"
echo "  - Services → banIP 和 adblock-fast → 启用并更新列表"
