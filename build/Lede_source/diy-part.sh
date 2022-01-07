#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# DIY扩展二合一了，在此处可以增加插件
#

cat >$NETIP <<-EOF
uci set network.lan.ipaddr='192.168.2.3'                                    # IPv4 地址(openwrt后台地址)
uci set network.lan.netmask='255.255.255.0'                                 # IPv4 子网掩码
uci set network.lan.gateway='192.168.2.1'                                   # IPv4 网关
uci set network.lan.broadcast='192.168.2.254'                               # IPv4 广播
uci set network.lan.dns='223.6.6.6'                                         # DNS(多个DNS要用空格分开)
uci set network.lan.delegate='0'                                            # 去掉LAN口使用内置的 IPv6 管理
uci commit network                                                          # 不要删除跟注释,除非上面全部删除或注释掉了
uci set dhcp.lan.ignore='1'                                                 # 关闭DHCP功能
uci commit dhcp                                                             # 跟‘关闭DHCP功能’联动,同时启用或者删除跟注释
uci set system.@system[0].hostname='OpenWrt'                               # 修改主机名称为OpenWrt
EOF

# 版本号里显示一个自己的名字（jellyfin build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
# sed -i 's/OpenWrt /jellyfin build $(TZ=UTC-8 date "%Y-%m-%d") @ OpenWrt /g' openwrt/package/lean/default-settings/files/zzz-default-settings
sed -i "s/OpenWrt /jellyfin Compiled in $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
#sed -i "s/OpenWrt /jellyfin Compiled in $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ
# 修改机器名称
#sed -i 's/OpenWrt/jellyfin/g' package/base-files/files/bin/config_generate
# 关闭IPv6 分配长度
sed -i '/ip6assign/d' package/base-files/files/bin/config_generate

# 添加新版argon主题
rm -rf ../lean/luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config

                                                
# 选择edge为默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i "/commit luci/i\uci set luci.main.mediaurlbase='/luci-static/argon'" package/lean/default-settings/files/zzz-default-settings

# 替换密码（要替换密码就不能设置密码为空）
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0/$1$PhflQnJ1$yamWfH5Mphs4hXV7UXWQ21:18725/g' $ZZZ          

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ

# 修改内核版本为5.4
sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g' target/linux/x86/Makefile                        

# 修改内核版本为4.19
#sed -i 's/PATCHVER:=5.4/PATCHVER:=4.19/g' target/linux/x86/Makefile  
# 自定义软件源
#sed -i '$a src-git kenzok https://github.com/kenzok8/openwrt-packages' feeds.conf.default           # 常用插件源
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default                       # 常用插件源_依赖安装
# 删除自带插件
# rm -rf ./feeds/kenzok/luci-app-ssr-plus               # 删除SSR-PLUS
# rm -rf ./feeds/garypang/luci-app-ssr-plus             # 删除SSR-PLUS
# rm -rf ./package/luci-app-ssr-plus/luci-app-ssr-plus  # 删除SSR-PLUS
rm -rf ./feeds/packages/net/aria2                       # 删除aria2
rm -rf ./feeds/packages/net/ariang                      # 删除aria2
rm -rf ./feeds/luci/applications/luci-app-aria2         # 删除aria2
rm -rf ./feeds/luci/applications/luci-app-samba# 删除samba 不能与samba4同时编译
rm -rf ./package/lean/autosamba
rm -rf ./feeds/luci/applications/luci-app-upnp          # 删除upnp自动端口映射
rm -rf ./feeds/luci/applications/luci-app-wol           # 删除wol网络唤醒
# rm -rf ./feeds/luci/applications/luci-app-nlbwmon       # 删除nlbwmon流量监控
rm -rf ./package/lean/luci-app-pptp-server              # 删除PPTP-VPN服务端
rm -rf ./package/lean/luci-app-qbittorrent              # 删除qbittorrent
rm -rf ./package/lean/qBittorrent-static                # 删除qbittorrent
rm -rf ./package/lean/luci-app-qbittorrent_static       # 删除qbittorrent
rm -rf ./feeds/packages/net/zerotier                    # 删除zerotier内网穿透
rm -rf ./package/lean/luci-app-zerotier                 # 删除zerotier内网穿透
rm -rf ./package/lean/luci-app-unblockmusic             # 删除网易云音乐解锁
rm -rf ./package/lean/UnblockNeteaseMusic-Go            # 删除网易云音乐解锁
# rm -rf ./package/lean/adbyby                            # 删除广告大师
# rm -rf ./package/lean/luci-app-adbyby-plus              # 删除广告大师
rm -rf ./package/lean/luci-app-xlnetacc                 # 删除迅雷快鸟
rm -rf ./package/lean/uugamebooster                     # 删除UU游戏加速
rm -rf ./package/lean/luci-app-uugamebooster            # 删除UU游戏加速
rm -rf ././package/lean/vlmcsd
rm -rf ./package/lean/luci-app-vlmcsd
rm -rf ./package/lean/vsftpd-alt
rm -rf ./package/lean/luci-app-vsftpd
rm -rf ./feeds/luci/applications/luci-app-ddns
rm -rf ./package/lean/luci-app-filetransfer
rm -rf ./package/lean/luci-app-autoreboot
rm -rf ./package/lean/luci-app-ttyd
# rm -rf ./feeds/luci/applications/luci-app-autoupdate
rm -rf ./feeds/luci/applications/luci-app-adguardhome
rm -rf ./package/lean/luci-app-dockerman        # 删除大雕docker
rm -rf ./package/lean/luci-lib-docker           # 删除大雕docker
git clone https://github.com/skycn3322/luci-app-adguardhome.git package/adguardhome
# git clone --depth=1 -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge
# 自定义插件
sed -i '$a src-git serverchan https://github.com/tty228/luci-app-serverchan' feeds.conf.defaul

# 增加防火墙规则
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user

# 修改插件名字
sed -i 's/"BaiduPCS Web"/"百度网盘"/g' package/lean/luci-app-baidupcs-web/luasrc/controller/baidupcs-web.lua
sed -i 's/"aMule设置"/"电驴下载"/g' package/lean/luci-app-amule/po/zh-cn/amule.po
sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-amule/po/zh-cn/amule.po
sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/"FTP 服务器"/"FTP服务"/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-flowoffload/po/zh-cn/flowoffload.po
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' package/lean/luci-app-turboacc/po/zh-cn/turboacc.po
sed -i 's/"实时流量监测"/"流量"/g' package/lean/luci-app-wrtbwmon/po/zh-cn/wrtbwmon.po
sed -i 's/"上网时间控制"/"上网控制"/g' package/lean/luci-app-accesscontrol/po/zh-cn/mia.po
sed -i 's/"KMS 服务器"/"KMS激活"/g' package/lean/luci-app-vlmcsd/po/zh-cn/vlmcsd.po
sed -i 's/"TTYD 终端"/"shell终端"/g' package/lean/luci-app-ttyd/po/zh-cn/terminal.po
sed -i 's/"USB 打印服务器"/"网络打印"/g' package/lean/luci-app-usb-printer/po/zh-cn/usb-printer.po
sed -i 's/"网络存储"/"存储"/g' package/lean/luci-app-usb-printer/po/zh-cn/usb-printer.po
#sed -i 's/"Web 管理"/"Web"/g' package/lean/luci-app-webadmin/po/zh-cn/webadmin.po
sed -i 's/"管理权"/"改密码"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po
sed -i 's/"带宽监控"/"监视"/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
sed -i 's/"Dynamic DNS"/"动态 DNS"/g' feeds/luci/applications/luci-app-ddns/po/zh-cn/ddns.po
sed -i 's/"Frp 内网穿透"/"内网穿透"/g' package/lean/luci-app-frpc/po/zh-cn/frp.po
sed -i 's/"Argon 主题设置"/"Argon设置"/g' feeds/luci/applications/luci-app-argon-config/po/zh-cn/argon-config.po
