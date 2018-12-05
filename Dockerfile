FROM debian:jessie-slim
LABEL maintainer="SuperITMan <admin@superitman.com>"

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
    fail2ban \
    iptables \
    exim4 \
    bsd-mailx \
    whois \
    && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /etc/fail2ban

COPY jail.local ./
COPY filter.d/ ./filter.d/
COPY action.d/ ./action.d/

ENTRYPOINT ["/entrypoint.sh"]
