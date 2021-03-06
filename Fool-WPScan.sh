#!/bin/bash
# author:Se7en
#使用方法【. Fool-WPScan.sh】

read -p "请输入要检测的网址：" url
while [[ $str != 'exit' ]]
do
	echo "枚举账户：1"
	echo "爆破密码：2"
	echo "枚举存在漏洞插件：3"
	echo "枚举存在漏洞主题：4"
	echo "TimThumbs文件漏洞：5"
	echo "退出：exit"
	read -p "请输入选项：" str
	case $str in
        1)
            wpscan --url $url --enumerate u --rua
            ;;
        2)
            read -p "请输入字典路径：" password
            read -p "请输入爆破线程：" threads
            wpscan --url $url -e u -P $password --max-threads $threads --rua
            ;;
        3)
            wpscan --url $url --enumerate vp --rua
            ;;
        4)
            wpscan --url $url --enumerate vt --rua
            ;;
        5)
            wpscan --url $url --enumerate tt --rua
			;;
	esac
done
unset url
unset str
