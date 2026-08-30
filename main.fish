#!/bin/fish

set ABI x86_64  # 根据电脑架构改

#确保文件存在
function chk_file
    set f $argv[1]
    if not test -f $f
        echo "Error: $f not found"
        exit 1
    end
end
chk_file magisk.apk
chk_file ramdisk.cpio

#处理advancedFeatures.ini
if test -f advancedFeatures.ini
    mv advancedFeatures.ini advancedFeatures.bak.ini
    sed -e "s/SystemAsRoot = on/SystemAsRoot = off/" advancedFeatures.backup.ini >advancedFeatures.ini
end

rm -rf work
install -d work
cd work
unzip ../magisk.apk 'assets/*'
unzip ../magisk.apk "lib/$ABI/*"
set mb lib/$ABI/libmagiskboot.so
chmod +x $mb
$mb compress=xz lib/$ABI/libmagisk.so magisk.xz
$mb compress=xz lib/$ABI/libinit-ld.so init-ld.xz
$mb compress=xz assets/stub.apk stub.xz
mv lib/$ABI/libmagiskinit.so magiskinit
echo 'KEEPVERITY=false
KEEPFORCEENCRYPT=false
RECOVERYMODE=false
VENDORBOOT=false
' >config
cp ../ramdisk.cpio ramdisk.cpio
$mb cpio ramdisk.cpio \
  "add 0750 init magiskinit" \
  "mkdir 0750 overlay.d" \
  "mkdir 0750 overlay.d/sbin" \
  "add 0644 overlay.d/sbin/magisk.xz magisk.xz" \
  "add 0644 overlay.d/sbin/stub.xz stub.xz" \
  "add 0644 overlay.d/sbin/init-ld.xz init-ld.xz" \
  "patch" \
  "backup ../ramdisk.cpio" \
  "mkdir 000 .backup" \
  "add 000 .backup/.magisk config"
gzip ramdisk.cpio -c >ramdisk.img
