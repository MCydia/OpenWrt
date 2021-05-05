#!/bin/bash
ZZZ="package/lean/default-settings/files/zzz-default-settings"
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#

sed -i "/uci commit fstab/a\uci commit network" $ZZZ
sed -i "/uci commit network/i\uci set network.lan.ipaddr='10.10.10.251'" $ZZZ               # IPv4 地址(openwrt后台地址)
sed -i "/uci commit network/i\uci set network.lan.netmask='255.255.255.0'" $ZZZ             # IPv4 子网掩码
sed -i "/uci commit network/i\uci set network.lan.gateway='10.10.10.250'" $ZZZ              # IPv4 网关
sed -i "/uci commit network/i\uci set network.lan.broadcast='10.10.10.255'" $ZZZ            # IPv4 广播
sed -i "/uci commit network/i\uci set network.lan.dns='10.10.10.253'" $ZZZ                  # DNS(多个DNS要用空格分开)
sed -i "/uci commit network/i\uci set network.lan.delegate='0'" $ZZZ                        # 去掉LAN口使用内置的 IPv6 管理

sed -i 's/luci-theme-bootstrap/luci-theme-rosy/g' feeds/luci/collections/luci/Makefile      # 强制选择rosy为默认主题选项

sed -i "/uci commit system/i\uci set system.@system[0].hostname='OpenWrt'" $ZZZ             # 修改主机名称为OpenWrt

sed -i "s/OpenWrt /MCydia Compiled in $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ       # 增加自己个性名称MCydia

sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ                                                      # 设置密码为空

# sed -i 's/PATCHVER:=5.4/PATCHVER:=4.19/g' target/linux/x86/Makefile                       # 修改内核版本为4.19


# 修改插件名字
sed -i 's/"BaiduPCS Web"/"百度网盘"/g' package/lean/luci-app-baidupcs-web/luasrc/controller/baidupcs-web.lua
sed -i 's/("qBittorrent"))/("BT下载"))/g' package/lean/luci-app-qbittorrent/luasrc/controller/qbittorrent.lua
sed -i 's/"aMule设置"/"电驴下载"/g' package/lean/luci-app-amule/po/zh-cn/amule.po
sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-amule/po/zh-cn/amule.po
sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po
sed -i 's/"实时流量监测"/"流量"/g' package/lean/luci-app-wrtbwmon/po/zh-cn/wrtbwmon.po
sed -i 's/"KMS 服务器"/"KMS激活"/g' package/lean/luci-app-vlmcsd/po/zh-cn/vlmcsd.zh-cn.po
sed -i 's/"TTYD 终端"/"命令窗"/g' package/lean/luci-app-ttyd/po/zh-cn/terminal.po
sed -i 's/"USB 打印服务器"/"打印服务"/g' package/lean/luci-app-usb-printer/po/zh-cn/usb-printer.po
sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-usb-printer/po/zh-cn/usb-printer.po
sed -i 's/"Web 管理"/"Web"/g' package/lean/luci-app-webadmin/po/zh-cn/webadmin.po
sed -i 's/"管理权"/"改密码"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po
sed -i 's/"带宽监控"/"监视"/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
sed -i 's/"动态 DNS"/"Dynamic DNS"/g' feeds/luci/applications/luci-app-ddns/po/zh-cn/ddns.po
sed -i 's/"解锁网易云灰色歌曲"/"NetEase music"/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
