FROM debian:bullseye

RUN apt-get update && apt-get install -y php \
	php-mysql wget && \
	wget https://www.adminer.org/latest.php -O /var/www/html/adminer.php

RUN chmod 755 /var/www/html/adminer.php && \
	chown -R www-data:www-data /var/www/html/adminer.php

COPY requirements/bonus/adminer/tools/script.sh /

CMD ["bash", "script.sh"]
