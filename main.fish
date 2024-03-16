#!/bin/fish

#确保文件存在
function chk_file
    set f $argv[1]
    if not test -f $f
        echo "Error: $f not found"
        exit
    end
end
chk_file magisk.apk
chk_file ramdisk.img
chk_file advancedFeatures.ini

#处理advancedFeatures.ini
mv advancedFeatures.ini advancedFeatures.bak.ini
sed -e "s/SystemAsRoot = on/SystemAsRoot = off/" advancedFeatures.backup.ini >advancedFeatures.ini

#Get busybox
echo Please start avd
adb wait-for-device
set abi (adb shell getprop ro.product.cpu.abi)
unzip -oj magisk.apk "lib/$abi/libbusybox.so"
mv libbusybox.so busybox
chmod +x busybox
adb push busybox /data/local/tmp

#patch
adb push avd_patch.sh /data/local/tmp
adb push magisk.apk /data/local/tmp
adb push ramdisk.img /data/local/tmp/ramdisk.cpio.tmp
adb shell sh /data/local/tmp/avd_patch.sh

mv ramdisk.img ramdisk.bak.img
adb pull /data/local/tmp/ramdisk.cpio.gz ramdisk.img
echo Finish!
