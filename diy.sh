#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/10.10.10.251/g' package/base-files/files/bin/config_generate
pwd
ls -l
echo "开始 DIY 配置"
pwd
ls -l
