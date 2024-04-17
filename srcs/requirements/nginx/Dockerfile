FROM debian:bullseye

# RUN apk update &&\
# 	apk add nginx && mkdir -p /etc/nginx/ssl/
RUN apt update &&\
	apt install nginx -y && mkdir -p /etc/nginx/ssl/
# COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default /etc/nginx/sites-enabled/
COPY ./tools/certificat.crt /etc/nginx/ssl
COPY ./tools/key.pem /etc/nginx/ssl

EXPOSE 443


CMD ["nginx", "-g", "daemon off;"]
