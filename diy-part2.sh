#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# 解决shadowsocksr-libev源缺少依赖问题
# ln -s ./feeds/helloworld/shadowsocksr-libev/ ./package/feeds/helloworld/shadowsocksr-libev

# 使用旧版的travelmate
# wget 'https://github.com/wekingchen/Actions-OpenWrt/raw/main/myfiles/travelmate2.04.zip' --no-check-certificate && sudo unzip -o travelmate2.04.zip && sudo rm -f travelmate2.04.zip

# 使用新版的luci-app-travelmate
#wget 'https://github.com/wekingchen/Actions-OpenWrt/raw/main/myfiles/luci-app-travelmate.zip' --no-check-certificate && sudo unzip -o luci-app-travelmate.zip && sudo rm -f luci-app-travelmate.zip

# 添加go-aliyundrive-webdav代码
git clone https://github.com/jerrykuku/go-aliyundrive-webdav package/go-aliyundrive-webdav
git clone https://github.com/jerrykuku/luci-app-go-aliyundrive-webdav package/luci-app-go-aliyundrive-webdav

./scripts/feeds update -a
./scripts/feeds install -a

#2月16日添加手动修正btrfs-progs编译错误的问题
rm -rf ./feeds/packages/utils/btrfs-progs
svn co https://github.com/WYC-2020/packages/trunk/utils/btrfs-progs ./feeds/packages/utils/btrfs-progs
