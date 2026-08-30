# Magisk on Avd
To build and patch from source, please clone Official Magisk repository (https://github.com/topjohnwu/Magisk) and execute `build.py avd_patch` \
More information at [Official Magisk repository](https://github.com/topjohnwu/Magisk)

# Usage
1. Install **fish git adb unzip**
2. Clone this repository
3. Copy **ramdisk.img & advancedFeatures.ini** here. (Usually they are in ~/Android/Sdk/system-images/android-*api*/*type*/*abi*)
4. Download **magisk.apk** here
5. Decompress `ramdisk.img` to get `ramdisk.cpio`.
6. Run `fish main.fish`
7. Copy **work/ramdisk.img & advancedFeatures.ini** back

# License
Of course same as Official Magisk \
**GPL-3**
