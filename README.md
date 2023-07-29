# Magisk on Avd
To build and patch from source, please clone Official Magisk repository (https://github.com/topjohnwu/Magisk) and execute `build.py avd_patch` \
More information at [Official Magisk repository](https://github.com/topjohnwu/Magisk)

# Usage
1. Install **fish git adb unzip**
1. Clone this repository
2. **!! Backup !!** and copy **ramdisk.img & advancedFeatures.ini** here. (Usually they are in ~/Android/Sdk/system-images/android-*api*/*type*/*abi*)
3. Download **magisk.apk** here
4. Start avd
4. Run `fish main.fish`
5. Shutdown avd
5. Copy **ramdisk.img & advancedFeatures.ini** back
6. Start avd again, and you can find magisk now

# License
Of course same to Official Magisk \
**GPL-3**