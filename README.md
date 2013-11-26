android_apk_tool
================
NOTICE:

When use jarsigner to resign the new apk, it should use Java 1.6, 1.7 has some problems.
  export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/


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


jenv
==========
tool to setup the Java home

https://github.com/gcuisinier/jenv
