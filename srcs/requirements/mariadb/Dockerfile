FROM debian:bookworm

USER root

RUN apt update && apt install -y \
    mariadb-server \
    mariadb-client && \
    rm -rf /var/lib/apt/lists/*

COPY ./tools/docker_entry.sh /usr/local/bin/docker_entry.sh
RUN chmod +x /usr/local/bin/docker_entry.sh

CMD ["docker_entry.sh"]
