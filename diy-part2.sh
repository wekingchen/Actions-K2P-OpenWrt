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

# 添加aliyundrive-webdav
rm -rf feeds/packages/multimedia/aliyundrive-webdav
rm -rf feeds/luci/applications/luci-app-aliyundrive-webdav
git clone https://github.com/messense/aliyundrive-webdav.git
cp -r aliyundrive-webdav/openwrt/aliyundrive-webdav feeds/packages/multimedia
cp -r aliyundrive-webdav/openwrt/luci-app-aliyundrive-webdav feeds/luci/applications
rm -rf aliyundrive-webdav

# 固定shadowsocks-rust版本以免编译失败
wget https://codeload.github.com/fw876/helloworld/zip/28504024db649b7542347771704abc33c3b1ddc8 -O helloworld.zip
unzip helloworld.zip
rm -rf feeds/helloworld/shadowsocks-rust
cp -r helloworld-28504024db649b7542347771704abc33c3b1ddc8/shadowsocks-rust feeds/helloworld
rm -rf feeds/passwall_package/shadowsocks-rust
cp -r helloworld-28504024db649b7542347771704abc33c3b1ddc8/shadowsocks-rust feeds/passwall_package
rm -rf helloworld.zip helloworld-28504024db649b7542347771704abc33c3b1ddc8
