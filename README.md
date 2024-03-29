
# OpenWrt X86-64 稳定项目

# 择要

- Lede_source=18.06=5.10
- Lienol_source=19.07=4.14
- Mortal_source=21.02=5.4
- openwrt_amlogic=N1和晶晨系列CPU专用
- openwrt_amlogic文件夹，编译S905x3, S905x2, S922x, S905x, S905d, s912自动打包您所需的固件

# 第一次使用请看如下：

- 云编译需要 [在此](https://github.com/settings/tokens) 创建个token,勾选：repo, workflow，保存所得的key
- 然后在此仓库Settings->Secrets中添加个名字为REPO_TOKEN的Secret,填入token获得的key,否者无法触发编译

- Secrets中添加 SCKEY 可通过[Server酱](http://sc.ftqq.com) 推送编译结果到微信

- Secrets中添加 TELEGRAM_CHAT_ID, TELEGRAM_TOKEN 可推送编译结果到Telegram Bot. [教程](https://longnight.github.io/2018/12/12/Telegram-Bot-notifications)


## 固件来源：

- 感谢[coolsnowwolf](https://github.com/coolsnowwolf/lede.git)大神提供的源码
- 感谢[Lienol](https://github.com/Lienol/openwrt.git)大神提供的源码
- 感谢[ctcgfw](https://github.com/project-openwrt/openwrt.git)大神提供的源码
- 感谢[P3TERX](https://github.com/P3TERX/Actions-OpenWrt)大神提供的一键编译脚本
- 感谢[garypang13](https://github.com/garypang13/Actions-OpenWrt)大神提供的一键编译脚本
- 感谢[tuanqing](https://github.com/tuanqing/mknop)大神提供的一键打包脚本
- 感谢[Hyy2001X](https://github.com/Hyy2001X/AutoBuild-Actions)大神，定时升级固件来源于此大神
- 感谢[hyird](https://github.com/hyird/Action-Openwrt)大神，是这仁兄告诉我有patch补丁这回事的
- 感谢微软免费提供的编译平台
- 感谢各位大佬提供的各种各样的插件
- 由衷感谢所有为openwrt无私奉献的大佬们

### 插件列表
1. [常用插件](https://github.com/coolsnowwolf/lede/wiki/%E5%B8%B8%E7%94%A8%E6%8F%92%E4%BB%B6%E5%BA%94%E7%94%A8%E8%AF%B4%E6%98%8E)
2. [全部插件](https://www.right.com.cn/forum/thread-3682029-1-1.html)
3. [全部插件github](https://github.com/RealKiro/gitblog/issues/4)


## 固件说明：
  - lean源码版本，内核为5.10（ipv4）版

 -  自动每7天更新一次，手动不定时更新

 -  ip：10.10.10.251 密码：为空

---
 ### 鸣谢！
 感谢以下各位大佬（排名无分先后）<br />
 
 [`coolsnowwolf`](https://github.com/coolsnowwolf/lede/tree/master)
 [`Lienol`](https://github.com/Lienol/openwrt/tree/22.03)
 [`immortalwrt`](https://github.com/immortalwrt/immortalwrt)
 [`P3TERX`](https://github.com/P3TERX/Actions-OpenWrt)
 [`Hyy2001X`](https://github.com/Hyy2001X/AutoBuild-Actions)
 [`dhxh`](https://github.com/dhxh/Openwrt-Build)
 [`ophub`](https://github.com/ophub/amlogic-s9xxx-openwrt)
 [`nicholas-opensource`](https://github.com/nicholas-opensource/OpenWrt-Autobuild)
 [`hx210`](#/README.md)
 [`hyird`](#/README.md)
 [`World Peace`](#/README.md)
 [`klever1988`](https://github.com/klever1988/cachewrtbuild)
 [`actions`](https://github.com/actions/upload-artifact)
 [`svenstaro`](https://github.com/svenstaro/upload-release-action)
