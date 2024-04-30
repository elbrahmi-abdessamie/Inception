FROM debian:bullseye

RUN apt update &&\
	apt install nginx -y && mkdir -p /etc/nginx/ssl/ && \
	apt clean && rm -rf /var/lib/apt/lists/*

COPY requirements/nginx/conf/default /etc/nginx/sites-enabled/
COPY requirements/nginx/tools/ /etc/nginx/ssl

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

