#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# DIY扩展二合一了，在此处可以增加插件
#

cat >$NETIP <<-EOF
uci set network.lan.ipaddr='10.10.10.251'                                   # IPv4 地址(openwrt后台地址)
uci set network.lan.netmask='255.255.255.0'                                 # IPv4 子网掩码
uci set network.lan.gateway='10.10.10.250'                                  # IPv4 网关
uci set network.lan.broadcast='10.10.10.255'                                # IPv4 广播
uci set network.lan.dns='10.10.10.253'                                      # DNS(多个DNS要用空格分开)
uci set network.lan.delegate='0'                                            # 去掉LAN口使用内置的 IPv6 管理
uci commit network                                                          # 不要删除跟注释,除非上面全部删除或注释掉了
uci set dhcp.lan.ignore='1'                                                 # 关闭DHCP功能
uci commit dhcp                                                             # 跟‘关闭DHCP功能’联动,同时启用或者删除跟注释
uci set system.@system[0].hostname='OpenWrt'                                # 修改主机名称为OpenWrt
EOF

# 关闭IPv6 分配长度
sed -i '/ip6assign/d' package/base-files/files/bin/config_generate
                                                
# 选择opentomcat为默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-opentomcat/g' feeds/luci/collections/luci/Makefile                    

# 替换密码（要替换密码就不能设置密码为空）
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0/$1$PhflQnJ1$yamWfH5Mphs4hXV7UXWQ21:18725/g' $ZZZ          

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ

# 修改内核版本为5.4
#sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.4/g' target/linux/x86/Makefile                        

# 修改内核版本为4.19
#sed -i 's/PATCHVER:=5.4/PATCHVER:=4.19/g' target/linux/x86/Makefile                                      


# 修改插件名字
sed -i 's/"BaiduPCS Web"/"百度网盘"/g' package/lean/luci-app-baidupcs-web/luasrc/controller/baidupcs-web.lua
sed -i 's/("qBittorrent"))/("BT下载"))/g' package/lean/luci-app-qbittorrent/luasrc/controller/qbittorrent.lua
sed -i 's/"aMule设置"/"电驴下载"/g' package/lean/luci-app-amule/po/zh-cn/amule.po
sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-amule/po/zh-cn/amule.po
sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-turboacc/po/zh-cn/turboacc.po
sed -i 's/"实时流量监测"/"流量"/g' package/lean/luci-app-wrtbwmon/po/zh-cn/wrtbwmon.po
sed -i 's/"KMS 服务器"/"KMS Server"/g' package/lean/luci-app-vlmcsd/po/zh-cn/vlmcsd.po
sed -i 's/"TTYD 终端"/"命令窗"/g' package/lean/luci-app-ttyd/po/zh-cn/terminal.po
sed -i 's/"USB 打印服务器"/"打印服务"/g' package/lean/luci-app-usb-printer/po/zh-cn/usb-printer.po
sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-usb-printer/po/zh-cn/usb-printer.po
sed -i 's/"Web 管理"/"Web"/g' package/lean/luci-app-webadmin/po/zh-cn/webadmin.po
sed -i 's/"管理权"/"改密码"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po
sed -i 's/"带宽监控"/"监视"/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
sed -i 's/"动态 DNS"/"Dynamic DNS"/g' feeds/luci/applications/luci-app-ddns/po/zh-cn/ddns.po
sed -i 's/"解锁网易云灰色歌曲"/"NetEase music"/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
sed -i 's/"Frp 内网穿透"/"Frp Intranet"/g' package/lean/luci-app-frpc/po/zh-cn/frp.po
sed -i 's/"Argon 主题设置"/"Argon Settings"/g' feeds/luci/applications/luci-app-argon-config/po/zh-cn/argon-config.po
