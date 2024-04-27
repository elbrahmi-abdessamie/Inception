#!/bin/bash

service vsftpd start
cat<<EOF > cr





y
EOF

adduser --home /var/www/html $FTP_USR --disabled-password < cr
rm cr
echo "${FTP_USR}:${FTP_PWD}" | /usr/sbin/chpasswd
chown -R $FTP_USR:$FTP_USR /var/www/html
echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null
adduser ${FTP_USR} root

sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g"  /etc/vsftpd.conf && \
sed -i "s|#local_enable=YES|local_enable=YES|g"  /etc/vsftpd.conf && \
sed -i "s|#write_enable=YES|write_enable=YES|g"  /etc/vsftpd.conf && \
sed -i "s|#local_umask=022|local_umask=007|g"  /etc/vsftpd.conf

echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf &&\
echo 'seccomp_sandbox=NO' >> /etc/vsftpd.conf && \
echo 'pasv_enable=YES' >> /etc/vsftpd.conf
service vsftpd stop

/usr/sbin/vsftpd
