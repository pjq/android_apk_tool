android_apk_tool
================

Android Apk uncompile and resign tools

Generate the keystore
==========
keytool -genkey -v -keystore android_apk_tool.keystore -alias android_apk_tool -keyalg RSA -keysize 2048 -validity 1000000
alias:android_apk_tool
pass:pjq.me

Resign APK
==========
cd resign_tool
./resign_apk.sh path_to_apk.apk

Uncompile apk
==========
./apktool D name.apk

Build apk
==========
./apktool B name/


