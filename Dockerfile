FROM debian:jessie
MAINTAINER SuperITMan <admin@superitman.com>

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update -y -q && \
    apt-get install -y -q --no-install-recommends\
    fail2ban \
    iptables \
    exim4 \
    bsd-mailx \
    whois \
    && rm -rf /var/lib/apt/lists/*

ADD docker-entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

COPY filter.d/ /etc/fail2ban/filter.d/
COPY action.d/ /etc/fail2ban/action.d/
COPY jail.local /etc/fail2ban/

ENTRYPOINT ["/usr/bin/entrypoint.sh"]