#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 基本不需要添加啥插件了,我搜集了各位大神的插件都集成一个软件包直接打入源码里面了
# 要了解增加了什么东西，就到我的专用软件包里面看看看吧，如果还是没有你需要的插件，请不要一下子就拉取别人的插件包
# 相同的文件都拉一起，因为有一些可能还是其他大神修改过的容易造成编译错误的
# 想要什么插件就单独的拉取什么插件就好，或者告诉我，我把插件放我的插件包就行了
# 软件包地址：https://github.com/281677160/openwrt-package
# 拉取插件请看《各种命令的简单介绍》第4条、第5条说明,不管大神还是新手请认真的看看,再次强调请不要一下子就拉取别人一堆插件的插件包,容易造成编译错误的
cd package
git clone https://github.com/longcat99/long.git
mkdir openwrt-packages
cd openwrt-packages
git clone https://github.com/frainzy1477/luci-app-clash.git
git clone https://github.com/destan19/OpenAppFilter.git
git clone https://github.com/jerrykuku/luci-app-ttnode.git
git clone https://github.com/linkease/ddnsto-openwrt.git
git clone https://github.com/lisaac/luci-app-dockerman.git
git clone https://github.com/lisaac/luci-lib-docker.git
git clone https://github.com/longcat99/luci-app-dnsfilter.git
git clone --depth 1 https://github.com/garypang13/smartdns-le
git clone https://github.com/kuoruan/luci-app-kcptun.git
git clone https://github.com/project-lede/luci-app-godproxy.git
svn co https://github.com/garypang13/openwrt-packages/trunk/lua-maxminddb
git clone https://github.com/riverscn/openwrt-iptvhelper.git && mv openwrt-iptvhelper/luci-app-iptvhelper/po/zh_Hans openwrt-iptvhelper/luci-app-iptvhelper/po/zh-cn
svn co https://github.com/Lienol/openwrt/trunk/package/network/fullconenat && rm -f fullconenat/patches/000-printk.patch        
git clone --depth 1 -b LUCI-LUA-UCITRACK https://github.com/CCnut/feed-netkeeper && mv -n feed-netkeeper/* ./ ; rm -Rf feed-netkeeper
git clone https://github.com/immortalwrt/openwrt-gowebdav
git clone --depth 1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config
git clone https://github.com/garypang13/luci-app-eqos.git
# git clone --depth 1 -b 18.06 https://github.com/riverscn/luci-app-omcproxy.git
git clone --depth 1 https://github.com/esirplayground/luci-app-LingTiGameAcc
git clone --depth 1 https://github.com/esirplayground/LingTiGameAcc
git clone --depth 1 https://github.com/sirpdboy/luci-app-autotimeset
git clone --depth 1 https://github.com/sirpdboy/luci-theme-opentoks
# svn co https://github.com/sirpdboy/netspeedtest/trunk/luci-app-NetSpeedTest
# svn co https://github.com/sirpdboy/netspeedtest/trunk/speedtest
