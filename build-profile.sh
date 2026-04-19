#!/bin/bash
cat >> .config << EOF
CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_DEVICE_generic=y

# LuCI
CONFIG_PACKAGE_luci=y
CONFIG_LUCI_LANG_zh_Hans=y

# 核心插件
CONFIG_PACKAGE_luci-app-passwall2=y
CONFIG_PACKAGE_luci-app-openclash=y

# 常用核心
CONFIG_PACKAGE_sing-box=y
CONFIG_PACKAGE_hysteria=y
CONFIG_PACKAGE_xray-core=y
CONFIG_PACKAGE_chinadns-ng=y

# 磁盘/USB 支持（x86 强烈推荐）
CONFIG_PACKAGE_kmod-fs-exfat=y
CONFIG_PACKAGE_kmod-fs-ntfs3=y
CONFIG_PACKAGE_block-mount=y
CONFIG_PACKAGE_kmod-usb-storage=y

# 其他常用
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-smartdns=y

# 启用 ccache（25.12 官方优化）
CONFIG_CCACHE=y
EOF

make defconfig
