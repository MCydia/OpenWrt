echo "开始 config 配置"
#此为必须,进入openwrt目录
pwd
ls -l
cd openwrt
pwd
ls -l

rm -f ./.config*
touch ./.config

#
# ========================固件定制部分========================
# 
# 
# 如果不对本区块做出任何编辑, 则生成默认配置固件. 
# 
# 以下为定制化固件选项和说明:
#
#
# 有些插件/选项是默认开启的, 如果想要关闭, 请参照以下示例进行编写:
# 
#          =========================================
#         |  # 取消编译VMware镜像:                   |
#         |  cat >> .config <<EOF                   |
#         |  # CONFIG_VMDK_IMAGES is not set        |
#         |  EOF                                    |
#          =========================================
#
# 
# 以下是一些提前准备好的一些插件选项.
# 直接取消注释相应代码块即可应用. 不要取消注释代码块上的汉字说明.
# 如果不需要代码块里的某一项配置, 只需要删除相应行.
#
# 如果需要其他插件, 请按照示例自行添加.
# 注意, 只需添加依赖链顶端的包. 如果你需要插件 A, 同时 A 依赖 B, 即只需要添加 A.
# 
# 无论你想要对固件进行怎样的定制, 都需要且只需要修改 EOF 回环内的内容.
# 
# 编译x64固件:
cat >> .config <<EOF
CONFIG_TARGET_x86=y
CONFIG_TARGET_x86_64=y
CONFIG_TARGET_x86_64_Generic=y
EOF
# 固件压缩:
cat >> .config <<EOF
CONFIG_TARGET_IMAGES_GZIP=y
EOF
# 编译UEFI固件:
cat >> .config <<EOF
CONFIG_EFI_IMAGES=y
EOF
# IPv6支持:
cat >> .config <<EOF
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=n
CONFIG_PACKAGE_ipv6helper=n
EOF
# 多文件系统支持:
cat >> .config <<EOF
CONFIG_PACKAGE_kmod-fs-nfs=y
CONFIG_PACKAGE_kmod-fs-nfs-common=y
CONFIG_PACKAGE_kmod-fs-nfs-v3=y
CONFIG_PACKAGE_kmod-fs-nfs-v4=y
CONFIG_PACKAGE_kmod-fs-ntfs=y
CONFIG_PACKAGE_kmod-fs-squashfs=y
EOF
# USB3.0支持:
cat >> .config <<EOF
CONFIG_PACKAGE_kmod-usb2=y
CONFIG_PACKAGE_kmod-usb2-pci=y
CONFIG_PACKAGE_kmod-usb3=y
EOF
# 常用LuCI插件选择:
cat >> .config <<EOF
# 下载软件 arir2,bt,pcs
CONFIG_PACKAGE_luci-app-aria2=n
CONFIG_PACKAGE_ariang=n
CONFIG_PACKAGE_luci-app-amule=n
CONFIG_PACKAGE_luci-app-qbittorrent=n
CONFIG_PACKAGE_luci-app-transmission=n
CONFIG_PACKAGE_luci-app-baidupcs-web=n
# 内网穿透
CONFIG_PACKAGE_luci-app-frpc=n
# 网络共享
CONFIG_PACKAGE_autosamba=n
CONFIG_PACKAGE_luci-app-samba=n
CONFIG_PACKAGE_samba36-server=n
CONFIG_PACKAGE_luci-app-cifsd=y
# 文件管理
CONFIG_PACKAGE_luci-app-filetransfer=y
CONFIG_PACKAGE_luci-app-filebrowser=y
# 广告过滤
CONFIG_PACKAGE_luci-app-koolproxyR=n
CONFIG_PACKAGE_luci-app-adbyby-plus=n
CONFIG_PACKAGE_luci-app-adguardhome=n
CONFIG_PACKAGE_luci-app-godproxy=n
CONFIG_PACKAGE_luci-app-dnsfilter=n
# 网易云
CONFIG_PACKAGE_luci-app-unblockmusic=n
CONFIG_UnblockNeteaseMusic_Go=n
CONFIG_UnblockNeteaseMusic_NodeJS=n
# vpn
CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-app-bypass=y
#CONFIG_PACKAGE_luci-app-vssr=n
#CONFIG_PACKAGE_luci-app-vssr-plus=n
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-app-webadmin=n
CONFIG_PACKAGE_luci-app-wrtbwmon=n
# 其他软件(京东签到,UU,smartdns,netdata,微信)
CONFIG_PACKAGE_luci-app-jd-dailybonus=n
CONFIG_PACKAGE_luci-app-uugamebooster=n
CONFIG_PACKAGE_luci-app-smartdns=n
CONFIG_PACKAGE_luci-app-netdata=y
CONFIG_PACKAGE_luci-app-serverchan=y
EOF
# 取消默认插件
cat >> .config <<EOF
CONFIG_PACKAGE_luci-app-music-remote-center=n
CONFIG_PACKAGE_luci-app-airplay2=n
CONFIG_PACKAGE_luci-app-vsftpd=n
CONFIG_PACKAGE_luci-app-ddns=n
CONFIG_PACKAGE_luci-app-xlnetacc=n
CONFIG_PACKAGE_luci-app-wol=n
CONFIG_PACKAGE_luci-app-upnp=n
CONFIG_PACKAGE_luci-app-sfe=n
CONFIG_PACKAGE_luci-app-accesscontrol=n
# zerotier内网穿透,使用VPN
CONFIG_PACKAGE_luci-app-zerotier=y
# 比Samba3无优势(硬盘休眠)
CONFIG_PACKAGE_luci-app-hd-idle=y
CONFIG_PACKAGE_luci-app-samba4=n
# 挂载远程共享
CONFIG_PACKAGE_luci-app-cifs-mount=n
CONFIG_PACKAGE_luci-app-openvpn-server=n
CONFIG_PACKAGE_luci-app-ipsec-vpnd=n
EOF
# LuCI主题:
cat >> .config <<EOF
CONFIG_PACKAGE_luci-theme-atmaterial=y
CONFIG_PACKAGE_luci-theme-argon=n
EOF
# 常用软件包:
cat >> .config <<EOF
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_screen=y
CONFIG_PACKAGE_tree=y
CONFIG_PACKAGE_vim-fuller=y
CONFIG_PACKAGE_wget=y
EOF
# 取消编译VMware镜像以及镜像填充 (不要删除被缩进的注释符号):
cat >> .config <<EOF
# CONFIG_TARGET_IMAGES_PAD is not set
# CONFIG_VMDK_IMAGES is not set
EOF

# 打开适用于VMware的VM Tools
cat >> .config <<EOF
CONFIG_PACKAGE_open-vm-tools=y
CONFIG_PACKAGE_open-vm-tools-fuse=y
EOF

# Image Options 分区设置
cat >> .config <<EOF
CONFIG_TARGET_KERNEL_PARTSIZE=30
CONFIG_TARGET_ROOTFS_PARTSIZE=300
EOF
# 
# ========================固件定制部分结束========================
# 
sed -i 's/^[ \t]*//g' ./.config
make defconfig
