#!/bin/bash

FTP_CONFIG_FILE="/etc/vsftpd.conf"
SSL_CERT="/etc/ssl/private/vsftpd.crt"
SSL_CRT_KET="/etc/ssl/private/vsftpd.key"
SCRIPT_FILE="/usr/local/bin/ftp_setup.sh"

sleep 15
service vsftpd start

cat<<EOF > cr





y
EOF

#SET UP FTP USER
adduser --home /var/www/html $FTP_USR --disabled-password < cr
rm cr
echo "${FTP_USR}:${FTP_PWD}" | /usr/sbin/chpasswd
chown -R $FTP_USR:$FTP_USR /var/www/html
echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null
adduser ${FTP_USR} root > /tmp/tst

#CREATE SSL CERTIFICATE FOR FTP
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $SSL_CRT_KET -out $SSL_CERT -subj "/C=XX/ST=Morocco/L=Khoribga/O=42/OU=1337/CN=aelbrahm.42.fr"

#ADD&MODIFIE CUSTOM FTP CONFIGURATION
sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g"  $FTP_CONFIG_FILE && \
sed -i "s|#local_enable=YES|local_enable=YES|g"  $FTP_CONFIG_FILE && \
sed -i "s|#write_enable=YES|write_enable=YES|g"  $FTP_CONFIG_FILE && \
sed -i "s|#local_umask=022|local_umask=007|g"  $FTP_CONFIG_FILE && \
sed -i "s|ssl_enable=NO|ssl_enable=YES|g"  $FTP_CONFIG_FILE && \

#SSL CONFIG FOR FTP
sed -i "s|rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem|rsa_cert_file=/etc/ssl/private/vsftpd.crt|g"  $FTP_CONFIG_FILE && \
sed -i "s|rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key|rsa_private_key_file=/etc/ssl/private/vsftpd.key|g"  $FTP_CONFIG_FILE

echo "allow_anon_ssl=YES" >> $FTP_CONFIG_FILE && \
echo "force_local_data_ssl=YES" >> $FTP_CONFIG_FILE && \
echo "force_local_logins_ssl=YES" >> $FTP_CONFIG_FILE && \
echo "force_local_logins_ssl=YES" >> $FTP_CONFIG_FILE && \
echo "ssl_tlsv1=YES" >> $FTP_CONFIG_FILE && \
echo "ssl_sslv2=NO" >> $FTP_CONFIG_FILE && \
echo "ssl_sslv3=NO" >> $FTP_CONFIG_FILE && \
echo "require_ssl_reuse=NO" >> $FTP_CONFIG_FILE && \
echo "ssl_ciphers=HIGH" >> $FTP_CONFIG_FILE && \

echo "allow_writeable_chroot=YES" >> $FTP_CONFIG_FILE && \
echo 'seccomp_sandbox=NO' >> $FTP_CONFIG_FILE && \
echo 'pasv_enable=YES' >> $FTP_CONFIG_FILE

service vsftpd stop

rm $SCRIPT_FILE

chown -R $FTP_USR:$FTP_USR /var/www/html/wp-content -v > /tmp/tst 2>err
#LAUNCH FTP DAEMON
echo "Here is the check" > /tmp/eTst
echo $FTP_USR > /tmp/dtp_usr
/usr/sbin/vsftpd

