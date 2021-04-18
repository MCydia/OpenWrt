#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 基本不需要添加啥插件了,我搜集了各位大神的插件都集成一个软件包直接打入源码里面了
# 要了解增加了什么东西，就到我的专用软件包里面看看看吧，如果还是没有你需要的插件，请不要一下子就拉取别人的插件包
# 相同的文件都拉一起，因为有一些可能还是其他大神修改过的容易造成编译错误的
# 想要什么插件就单独的拉取什么插件就好，或者告诉我，我把插件放我的插件包就行了
# 软件包地址：https://github.com/281677160/openwrt-package.git
# 拉取插件请看《各种命令的简单介绍》第4条、第5条说明,不管大神还是新手请认真的看看,再次强调请不要一下子就拉取别人一堆插件的插件包,容易造成编译错误的

#sirpdboy的源码仓库
#git clone https://github.com/siropboy/sirpdboy-package package/sirpdboy-package
#make menuconfig

#atmaterial主题
git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git
#opentomato主题
svn co https://github.com/solidus1983/luci-theme-opentomato/trunk/luci/themes/luci-theme-opentomato

# passwall 
git clone https://github.com/kenzok8/small.git
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall

# SSR
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-ssr-plus
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus
svn co https://github.com/fw876/helloworld/trunk/naiveproxy
svn co https://github.com/fw876/helloworld/trunk/tcping
svn co https://github.com/fw876/helloworld/trunk/xray
svn co https://github.com/fw876/helloworld/trunk/ipt2socks-alt

#helloworld
git clone https://github.com/jerrykuku/lua-maxminddb.git
git clone https://github.com/jerrykuku/luci-app-vssr.git  
# rm luci-app-vssr/root/etc/china_ssr.txt
# rm luci-app-vssr/root/etc/config/black.txt
# rm luci-app-vssr/root/etc/config/white.txt
# rm luci-app-vssr/root/etc/dnsmasq.oversea/oversea_list.conf
# rm luci-app-vssr/root/etc/dnsmasq.ssr/ad.conf
# rm luci-app-vssr/root/etc/dnsmasq.ssr/gfw_base.conf
# git clone https://github.com/Leo-Jo-My/my.git
# git clone https://github.com/liuwenwv/luci-app-vssr-plus.git

#bypass
git clone https://github.com/garypang13/luci-app-bypass.git

# openclash
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-openclash
# svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash
git clone https://github.com/vernesong/OpenClash.git && cp -r OpenClash/luci-app-openclash ./

# netdata
rm -rf luci-app-netdata && git clone https://github.com/sirpdboy/luci-app-netdata.git

# adguardhome  编译问题(https://github.com/rufengsuixing/luci-app-adguardhome/issues/83)
# 暂时先进入 github release 下载 ipk安装
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome
# git clone https://github.com/rufengsuixing/luci-app-adguardhome.git
svn co https://github.com/rufengsuixing/luci-app-adguardhome/branches/beta/

#KoolProxyR
# git clone https://github.com/jefferymvp/luci-app-koolproxyR.git
# git clone https://github.com/ycg31/luci-app-koolproxyR.git
svn co https://github.com/firker/diy-ziyong/trunk/luci-app-koolproxyR

#godproxy
git clone https://github.com/godros/luci-app-godproxy.git 

#dns广告过滤
git clone https://github.com/garypang13/luci-app-dnsfilter.git

# 文件管理 无法编译安装 进入github下载ipk手动安装
#git clone https://github.com/lyin888/luci-app-filebrowser.git
git clone https://github.com/MonwF/luci-app-filebrowser.git

# baidupcs-web 删库,等LEDE修复,先使用 此仓库
# rm -rf baidupcs-web
# svn co https://github.com/garypang13/Actions-OpenWrt-Nginx/trunk/common/diy/feeds/custom/luci/baidupcs-web

# 京东签到 (lede已添加)
# git clone https://github.com/jerrykuku/node-request.git
# git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git

# smartdns
svn co https://github.com/firker/diy-ziyong/trunk/smartdns
svn co https://github.com/firker/diy-ziyong/trunk/luci-app-smartdns

# serverchan 
git clone https://github.com/tty228/luci-app-serverchan.git

#透明网桥
# svn co https://github.com/kingyan/bridge/trunk/luci-app-bridge

#灵缇游戏加速
# git clone https://github.com/esirplayground/luci-app-LingTiGameAcc

#应用过滤 https://github.com/destan19/OpenAppFilter
