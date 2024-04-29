FROM debian:bullseye

RUN apt update &&\
	apt install nginx -y && \
	apt clean && rm -rf /var/lib/apt/lists/*

COPY requirements/bonus/website/conf/default /etc/nginx/sites-enabled/

RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html/
COPY requirements/bonus/website/assets/image /var/www/html/image/
COPY requirements/bonus/website/assets/css /var/www/html/css/
COPY requirements/bonus/website/assets/webfonts /var/www/html/webfonts/

EXPOSE 80
CMD ["nginx" , "-g", "daemon off;"]