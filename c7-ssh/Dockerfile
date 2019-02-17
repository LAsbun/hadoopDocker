FROM lasbun/centos7

# 安装openssh-server
RUN yum -y install openssh-server

# 安装 rsync
RUN yum -y install rsync

RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key

# 指定root密码
RUN /bin/echo 'root:123456'|chpasswd
RUN /bin/sed -i 's/.*session.*required.*pam_loginuid.so.*/session optional pam_loginuid.so/g' /etc/pam.d/sshd
RUN /bin/echo -e "LANG=\"en_US.UTF-8\"" > /etc/default/local
EXPOSE 22
CMD /usr/sbin/sshd -D