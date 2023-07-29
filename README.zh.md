# Magisk on avd
要从源码构建，请clone官方Magisk仓库 (https://github.com/topjohnwu/Magisk) 并执行`build.py avd_patch` \
更多信息请前往[官方Magisk仓库](https://github.com/topjohnwu/Magisk)

# 使用方法
1. 安装 **fish git adb unzip**
2. clone这个仓库
3. **！！备份！！** 并复制 **ramdisk.img & advancedFeatures.ini** 到这里。 (通常在 ~/Android/Sdk/system-images/android-*api*/*type*/*abi*)
4. 下载**magisk.apk**并放在这个文件夹
5. avd，启动！
6. 运行`fish main.fish`
7. 关闭avd
8. 把 **ramdisk.img & advancedFeatures.ini** 放回去

# 许可证
和官方Magisk一样 \
**GPL-3**