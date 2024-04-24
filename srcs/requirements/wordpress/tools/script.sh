# #!/bin/bash

# sleep 5

# mkdir -p /var/www/html



# chmod -R	775 /var/www/html;

# chown -R	www-data /var/www/html;

# sed -i		's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf
# service		php7.4-fpm start

# cd			/var/www/html



# rm -rf		*

# wp			core download --allow-root
# cat			wp-config-sample.php > wp-config.php

# wp			config set DB_HOST mariadb --type=constant --allow-root

# # sed -i -r	"s/database_name_here/${DB_NAME}/1"	/var/www/html/wp-config.php
# # sed -i -r	"s/username_here/${DB_USER}/1"		/var/www/html/wp-config.php
# # sed -i -r	"s/password_here/${DB_PASSWORD}/1"	/var/www/html/wp-config.php

# wp config set DB_NAME $MYSQL_DATABASE_NAME --path=/var/www/html --allow-root
# wp config set DB_USER $MYSQL_USER --path=/var/www/html --allow-root
# wp config set DB_PASSWORD $MYSQL_PASSWORD --path=/var/www/html --allow-root
# # wp config set DB_HOST $DB_NAME --path=/var/www/html --allow-root

# # wp 			core install	--url=${HOST_NAME}	-title=${WP_TITLE}	--admin_user=${DB_USER}			--admin_password=${DB_PASSWORD}	--admin_email=${WP_EMAIL} 	--skip-email	--allow-root
# wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

# wp			user create ${WP_USER} ${WP_EMAIL} --role=author --user_pass=${WP_PASSWORD} --allow-root


# kill		$(cat /var/run/php/php7.4-fpm.pid)

# php-fpm7.4 -F
# #!/bin/bash


# sleep 10


# # if [ ! -d "/Users/aelbrahm/goinfre/Inception/data" ]; then
# #         mkdir /Users/aelbrahm/goinfre/Inception/data
# #         mkdir /Users/aelbrahm/goinfre/Inception/data/mariadb
# #         mkdir /Users/aelbrahm/goinfre/Inception/data/wordpress
# # fi

# service php7.4-fpm start

# file="/etc/php/7.4/fpm/pool.d/www.conf"
# sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|g' "$file"


# wp core download --path=/var/www/html/ --allow-root

# wp core install --url="${WP_URL}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN_USER}" --admin_password="${WP_ADMIN_PASSWORD}" --admin_email="${WP_ADMIN_EMAIL}" --path=/var/www/html --allow-root
# # wp plugin update --all --path=/var/www/html --allow-root

# file="/var/www/html/wp-config.php"
# sed -i "s|database_name_here|${MYSQL_DATABASE_NAME}|g" "$file"
# sed -i "s|username_here|${MYSQL_USER}|g" "$file"
# sed -i "s|password_here|${MYSQL_PASSWORD}|g" "$file"


# service php7.4-fpm stop
# /usr/sbin/php-fpm7.4 -F
