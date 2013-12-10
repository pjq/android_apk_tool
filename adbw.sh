#!/bin/sh
#Created by pengjianqing@gmail.com
#Date:20131210
#Used to wrapper the Android adb command when has more than 1 devices connected.

adbdevices=`adb devices`
devices=`echo "$adbdevices"|grep device$`
line=`echo "${devices}"|grep device$|wc -l|sed 's/ //g'`
#echo "$devices"
#echo "$line"

if [ $line = 0 ];then
    echo "Can't find any devices, please check you cable."
elif [ $line = 1 ];then
    echo "Find one device:"
    echo "$devices"
    adb $@
else
    echo "Find more than one device:"
    devices=`echo "${devices}"|grep -n ""`
    echo "$devices"
    read -p "Please select your devices: " choose
    choose=`echo "${devices}"|grep "^${choose}:" |cut -d ":" -f2|sed 's/device//g'|sed 's/ //g'`

    if [ -z $choose  ];then
        echo "Your selection is wrong, can't find the device"
    else
        echo adb -s ${choose} $@
        adb -s ${choose} $@
    fi
fi

