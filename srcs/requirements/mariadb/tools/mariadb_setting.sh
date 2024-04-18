#!/bin/bash

# Start MariaDB service
service mariadb start
sleep 5

# Secure MariaDB installation
mysql_secure_installation << EOF > /dev/null 2>&1
n
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
n
n
n
n
EOF

# Create SQL script
cat <<EOF > db1.sql
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE_NAME;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE_NAME.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

# Execute SQL script
mariadb -u root -p"$MYSQL_ROOT_PASSWORD" < db1.sql
rm db1.sql

# Shutdown MariaDB service
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

# Start MariaDB service
mariadbd
