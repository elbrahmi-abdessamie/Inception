FROM debian:bullseye


RUN apt update -y && apt install -y php \
	php-cli php-fpm php-mysql \
	php-json php-opcache php-mbstring \
	php-xml php-gd php-curl wordpress curl  netcat && \
	apt clean && \
    rm -rf /var/lib/apt/lists/* && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


COPY requirements/wordpress/conf/wp-config.php /var/www/html/
COPY requirements/wordpress/tools/script.sh /
EXPOSE 9000

CMD ["bash", "script.sh"]