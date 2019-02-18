#!/bin/bash
#1 获取输入参数个数，如果没有参数，直接退出
pcount=$#
if((pcount==0)); then
echo no args;
exit;
fi

#2 获取文件名称
p1=$1
fname=`basename $p1`
echo fname=$fname

#3 获取上级目录到绝对路径
pdir=`cd -P $(dirname $p1); pwd`
echo pdir=$pdir

#4 获取当前用户名称
user=`whoami`

#5 循环
# hostname
myHostName=`hostname`
echo ------myHostName--------- $myHostName ----------------
for((host=1; host<4; host++)); do
        #echo $pdir/$fname $user@hadoop00$host:$pdir
        echo --------------- hadoop$host ----------------
	if [ $myHostName = "hadoop00"$host ]
	then
        echo -------xxxx-------- hadoop$host ----------------
		continue
	fi
        rsync -rvl $pdir/$fname $user@hadoop00$host:$pdir
done