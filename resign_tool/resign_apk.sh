#!/bin/sh

ALIAS="android_apk_tool"
KEYSTORE=./android_apk_tool.keystore
PASS="pjq.me"
tmp=tmp

if [ ${#} = 1 ];then
    rm -rf $tmp
    echo unzip "${1}" -d $tmp
    unzip "${1}" -d $tmp >/dev/null
    echo rm -rf $tmp/META-INF
    rm -rf $tmp/META-INF
    cd $tmp
    zip -r ../$tmp.zip * >/dev/null
    cd - 
    echo jarsigner  -verbose -keystore "${KEYSTORE}" -storepass "${PASS}" -signedjar ${tmp}_signed.zip ${tmp}.zip ${ALIAS}
    jarsigner  -verbose -keystore "${KEYSTORE}" -storepass "${PASS}" -signedjar ${tmp}_signed.zip ${tmp}.zip ${ALIAS} >/dev/null

    SIGNED_NAME=`basename ${1}|sed 's/.apk/_signed&/g'`
    echo mv ${tmp}_signed.zip ${SIGNED_NAME}
    mv ${tmp}_signed.zip ${SIGNED_NAME}
    rm ${tmp}.zip
    rm -rf $tmp
else
    echo "${0} path_to_your_apk.apk"
fi
