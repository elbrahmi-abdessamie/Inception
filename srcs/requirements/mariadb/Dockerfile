
FROM debian:bullseye

RUN apt-get update -y && apt-get install -y \
    --no-install-recommends \
    mariadb-server netcat \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements/mariadb/conf/ /etc/mysql/mariadb.conf.d/

COPY requirements/mariadb/tools/mariadb_setting.sh /

CMD ["bash", "mariadb_setting.sh"]




