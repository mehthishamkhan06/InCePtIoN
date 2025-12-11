from debian:bookworm

user:root

RUN apt update && apt install -y \
    mariadb-server \
    mariadb-client  && \
    rm -rf /var/lib/apt/lists/*

COPY ./requirements/mariadb/tools/docker_entry.sh /usr/local/bin/

CMD ["docker_entry.sh"]