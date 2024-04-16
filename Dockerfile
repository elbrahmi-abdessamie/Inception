FROM debian:bullseye

RUN apt-get update &&\
	apt-get install nginx -y
COPY ./configs /etc/nginx/sites-enabled
COPY ./Cert/cert.pem /etc/nginx/ssl
COPY ./Cert/key.pem /etc/nginx/ssl

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
