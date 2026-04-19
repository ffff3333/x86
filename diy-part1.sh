#!/bin/bash
cat >> feeds.conf.default << EOF
src-git passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main
src-git openclash https://github.com/vernesong/OpenClash.git;master
EOF
