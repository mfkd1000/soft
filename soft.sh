#!/bin/bash
#执行下面代码或者直接复制全部粘贴
#安装环境支持：

yum -y groupinstall "Development Tools"
yum -y install readline-devel ncurses-devel openssl-devel

#安装
#进入到local目录
cd /usr/local     
wget --no-check-certificate https://raw.githubusercontent.com//mfkd1000/soft/main/softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
#解压tar文件                                
tar zxvf softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
#查看文件
ls   
# 进入到vpnserver目录                                       
cd vpnserver/ 
#    查看文件                    
ls
#执行make                                        
make    
                        

#如果无法完成看上面内容，选择 ./vpnserver start 完成启动服务
./vpnserver start                       


#开机启动设置
# 解析：赋予/etc/rc.d/rc.local权限

chmod +x /etc/rc.d/rc.local 
# 打开将命令写到 /etc/rc.d/rc.local 这个文件中如下：  
           
# vi /etc/rc.d/rc.local      =>     /usr/local/vpnserver/vpnserver start                        

#或执行以下命令

echo '/usr/local/vpnserver/vpnserver start' >> /etc/rc.d/rc.local ;\


#开放443 、5555 TCP端口

firewall-cmd --permanent --zone=public --add-port=443/tcp
firewall-cmd --permanent --zone=public --add-port=5555/tcp
firewall-cmd --reload
#开放4500、500udp端口

firewall-cmd --permanent --zone=public --add-port=4500/udp
firewall-cmd --permanent --zone=public --add-port=500/udp
firewall-cmd --reload
cd /usr/local/
rm -rf softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
cd
rm -rf soft.sh
# 重启  
reboot 


