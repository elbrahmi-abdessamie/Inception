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

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/C=XX/ST=Morocco/L=Khoribga/O=42/OU=1337/CN=localhost"
sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g"  /etc/vsftpd.conf && \
sed -i "s|#local_enable=YES|local_enable=YES|g"  /etc/vsftpd.conf && \
sed -i "s|#write_enable=YES|write_enable=YES|g"  /etc/vsftpd.conf && \
sed -i "s|#local_umask=022|local_umask=007|g"  /etc/vsftpd.conf && \
# sed -i "s|ssl_enable=NO|ssl_enable=YES|g"  /etc/vsftpd.conf && \
# sed -i "s|rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem2|rsa_cert_file=/etc/ssl/private/vsftpd.crt|g"  /etc/vsftpd.conf && \
# sed -i "s|rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key|rsa_private_key_file=/etc/ssl/private/vsftpd.key|g"  /etc/vsftpd.conf

# echo "allow_anon_ssl=NO" >> /etc/vsftpd.conf && \
# echo "force_local_data_ssl=YES" >> /etc/vsftpd.conf && \
# echo "force_local_logins_ssl=YES" >> /etc/vsftpd.conf && \
# echo "ssl_tlsv1=YES" >> /etc/vsftpd.conf && \
# echo "ssl_sslv2=NO" >> /etc/vsftpd.conf && \
# echo "ssl_sslv3=NO" >> /etc/vsftpd.conf && \
# echo "require_ssl_reuse=NO" >> /etc/vsftpd.conf && \
# echo "ssl_ciphers=HIGH" >> /etc/vsftpd.conf && \

echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf && \
echo 'seccomp_sandbox=NO' >> /etc/vsftpd.conf && \
echo 'pasv_enable=YES' >> /etc/vsftpd.conf
service vsftpd stop

/usr/sbin/vsftpd
