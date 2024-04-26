FROM debian:bullseye

RUN apt-get update && apt-get install -y \
	redis-server \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 6379
COPY requirements/bonus/redis/conf/redis.conf /etc/redis/
CMD ["redis-server" , "--protected-mode", "no"]