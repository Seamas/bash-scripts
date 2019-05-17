#!/bin/zsh
function enable {
    sudo sed -i '' '/'$1'/d' $hosts
}

function disable {
	sudo echo '##'$1 >> $hosts
    sudo echo '127.0.0.1      '$1 >> $hosts
    sudo echo '127.0.0.1      www.'$1 >> $hosts
}
function refreshDNS {
    sudo killall -HUP mDNSResponder
}

# 检查是否带启动命令
if [[ $# < 1 ]]; then
    echo "please start with command 'enable' or 'disable'"
    exit 1;
fi

args=$#
hosts=/etc/hosts
# 命令
case "$1" in
	"enable")
		for ((i=2; i<=$args; ++i))
		do
		    enable $@[i]
		done
		refreshDNS;
		;;
	"disable")
		for ((j=2; j<=$args; ++j))
		do
			disable $@[j]
		done
		refreshDNS;
		;;
	*)
		echo "command not supported, only 'enable' or 'disable' is allowed"
		exit 1; 
		;;
esac
exit 0;
