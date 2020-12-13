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

# 添加第三方软件包
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-openclash package/luci-app-openclash
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-eqos package/luci-app-eqos
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome package/luci-app-adguardhome
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial package/luci-theme-atmaterial
svn co https://github.com/destan19/OpenAppFilter/trunk package/OpenAppFilter
svn co https://github.com/tty228/luci-app-serverchan/trunk package/luci-app-serverchan
svn co https://github.com/pymumu/luci-app-smartdns/branches/lede package/luci-app-smartdns
svn co https://github.com/garypang13/luci-theme-edge/branches/18.06 package/luci-theme-edge

# 替换更新默认 argon 主题
rm -rf package/lean/luci-theme-argon && svn co https://github.com/jerrykuku/luci-theme-argon/branches/18.06 package/luci-theme-argon

# 替换更新 passwall 和 ssrplus+
rm -rf package/openwrt-packages/luci-app-passwall && svn co https://github.com/xiaorouji/openwrt-passwall/branches/main package/openwrt-passwall
rm -rf package/openwrt-packages/luci-app-ssr-plus && svn co https://github.com/fw876/helloworld package/openwrt-packages/helloworld

# 添加 ssrplus+ 依赖库
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/microsocks package/microsocks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/redsocks2 package/redsocks2

# 替换更新 haproxy 默认版本
rm -rf feeds/packages/net/haproxy && svn co https://github.com/Lienol/openwrt-packages/trunk/net/haproxy feeds/packages/net/haproxy

# 自定义定制选项
sed -i 's#192.168.1.1#10.10.10.1#g' package/base-files/files/bin/config_generate # 定制默认 IP
sed -i 's@background-color: #e5effd@background-color: #f8fbfe@g' package/luci-theme-edge/htdocs/luci-static/edge/cascade.css # luci-theme-edge 主题颜色微调
sed -i 's#rgba(223, 56, 18, 0.04)#rgba(223, 56, 18, 0.02)#g' package/luci-theme-edge/htdocs/luci-static/edge/cascade.css # luci-theme-edge 主题颜色微调
