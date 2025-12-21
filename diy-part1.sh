#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
#sudo rm -rf feeds/packages/net/{xray-core,v2ray-geodata,sing-box,chinadns-ng,dns2socks,hysteria,ipt2socks,microsocks,naiveproxy,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,simple-obfs,tcping,trojan-plus,tuic-client,v2ray-plugin,xray-plugin,geoview,shadow-tls}
#git clone https://github.com/xiaorouji/openwrt-passwall-packages package/passwall-packages
#git clone https://github.com/sbwml/packages_lang_golang -b 25.x feeds/packages/lang/golang
#sudo apt update
#sudo apt install build-essential clang flex bison g++ gawk \
#gcc-multilib g++-multilib gettext git libncurses-dev libssl-dev \
#python3-distutils python3-setuptools rsync swig unzip zlib1g-dev file wget
#sed -i 's/--set=llvm\.download-ci-llvm=true/--set=llvm.download-ci-llvm=false/' feeds/packages/lang/rust/Makefile
# Add a feed source
#sed -i '1i src-git immortalwrt_packages https://github.com/immortalwrt/packages' feeds.conf.default
#sed -i '1i src-git passwall_packages https://github.com/ffff3333/openwrt-passwall-packages' feeds.conf.default
#sed -i '1i src-git passwall_packages https://github.com/ffff3333/packages_updated' feeds.conf.default
#sed -i '1i src-git flrz https://github.com/flrz/passwall_packages' feeds.conf.default
#sed -i '1i src-git passwall_packages https://github.com/ffff3333/openwrt-passwall-packages' feeds.conf.default
#sed -i '1i src-git passwall-packages https://github.com/xiaorouji/openwrt-passwall-packages' feeds.conf.default
#sed -i '2i src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
#sed -i '3i src-git openclash https://github.com/vernesong/OpenClash' feeds.conf.default
#sed -i '4i src-git argon https://github.com/ffff3333/themes' feeds.conf.default
sed -i '1i src-git small https://github.com/kenzok8/small' feeds.conf.default
sed -i '2i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
