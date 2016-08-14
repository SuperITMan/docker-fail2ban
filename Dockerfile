FROM debian:jessie
MAINTAINER SuperITMan <admin@superitman.com>

RUN apt-get update && \
    apt-get install -y \
    fail2ban \
    iptables \
    && export DEBIAN_FRONTEND=noninteractive \
    && rm -rf /var/lib/apt/lists/*

ADD docker-entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

COPY filter.d/ /etc/fail2ban/filter.d/
COPY action.d/ /etc/fail2ban/action.d/
COPY jail.local /etc/fail2ban/

ENTRYPOINT ["/usr/bin/entrypoint.sh"]