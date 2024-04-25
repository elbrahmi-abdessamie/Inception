FROM debian:bullseye

# RUN apk update &&\
# 	apk add nginx && mkdir -p /etc/nginx/ssl/
RUN apt update &&\
	apt install nginx -y && mkdir -p /etc/nginx/ssl/ && \
	apt clean && rm -rf /var/lib/apt/lists/*
# COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY requirements/nginx/conf/default /etc/nginx/sites-enabled/
COPY requirements/nginx/tools/ /etc/nginx/ssl
COPY requirements/nginx/index.html /var/www/

EXPOSE 443


CMD ["nginx", "-g", "daemon off;"]

