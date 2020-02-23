#!/bin/bash
echo ---------------------------------------------------------
echo 战神一键搭建脚本
echo MADE BY FANGXX
echo Base By 缔梦天成
echo 安装前请确认已安装docker环境
echo 脚本发布时战神版本为7.7
echo "Docker Hub地址：https://hub.docker.com/r/dmtc/zhan-shen"
echo ---------------------简介分割线--------------------------
echo -e "容器简介：战神容器是一个集多种功能于一身的大型网页容器\n          容器拥有ddns+frpc+frps+酸奶+远程下载+博客……等功能"
echo ""

echo "端口列表：65530+8118+8119+1080+6800+8080+9091+8999+8120+8121+1082"
echo ""
echo "端口详细信息："
echo -e "65530 功能控制台\n54321 全能DDNS解析\n8118+8120酸奶代理端口 手机和电脑浏览器使用（选择代理）\n8119+8121酸奶代理端口 手机和电脑浏览器使用（全局代理）\n1080+1082酸奶初级代理 供给Linux终端使用 用于Linux终端访问\n6800 aria2下载用的\n8999 qbittorrent下载器\n8080 utorrent下载器\n9091 transmission下载器"
echo ---------------------安装分割线-------------------------
echo -n "请输入本地aria2下载目录[必填]>>>"
read aria2

echo -n "请输入本地utorrent下载目录[必填]>>>"
read utorrent

echo -n "请输入本地transmission下载目录[必填]>>>"
read transmission

echo -n "请输入本地qbittorrent下载目录[必填]>>>"
read qbittorrent

echo    "请输入安装版本[必填]"
echo -n "如果不清楚，请填写7.7>>>"
read version

echo -n "请输入容器名称[自定义-小写英文-不可空格]>>>"
read name


read -r -p "请确认是否开启自动启动? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
		echo "你的选择:Yes"
		restart="--restart=always"
		;;

    [nN][oO]|[nN])
		echo "你的选择:No"
		restart=""
       		;;

    *)
	echo "您输入的字符串不是Y或N"
	exit 1
	;;
esac

read -r -p "请确认是否开始安装? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
                echo "你的选择:Yes"
		echo "开始pull镜像"
		
		docker pull registry.cn-hangzhou.aliyuncs.com/dmtc/zhan-shen:${version}

		echo "开始安装"

		echo "命令内容："
		echo "docker run -d --net=host ${restart} --name=${name} -v ${aria2}:/downloads/aria2 -v ${utorrent}:/downloads/utorrent -v ${transmission}:/downloads/transmission -v ${qbittorrent}:/downloads/qbittorrent registry.cn-hangzhou.aliyuncs.com/dmtc/zhan-shen:${version} /bin/bash ./auto.sh"
		echo ""
		echo ""

		docker run -d --net=host ${restart} --name=${name} -v ${aria2}:/downloads/aria2 -v ${utorrent}:/downloads/utorrent -v ${transmission}:/downloads/transmission -v ${qbittorrent}:/downloads/qbittorrent registry.cn-hangzhou.aliyuncs.com/dmtc/zhan-shen:${version} /bin/bash ./auto.sh
		
		
                ;;

    [nN][oO]|[nN])
                echo "你的选择:No"
		echo "退出安装！"
                exit
                ;;

    *)
        echo "您输入的字符串不是Y或N"
        exit 1
        ;;
esac
