#!/bin/bash
cat >> feeds.conf.default << EOF
src-git passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main
src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main
src-git openclash https://github.com/vernesong/OpenClash.git;master
src-git argon https://github.com/jerrykuku/luci-theme-argon.git;master
EOF
