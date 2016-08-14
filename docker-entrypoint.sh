#!/bin/bash

function setTimeZone {
    CLIENT_TIMEZONE=$(cat /etc/timezone)
    HOST_TIMEZONE=$(cat /etc/timezone.host)

    if [ "${CLIENT_TIMEZONE}" != "${HOST_TIMEZONE}" ]; then
        echo "Reconfigure timezone to "${HOST_TIMEZONE}
        echo ${HOST_TIMEZONE} > /etc/timezone
        dpkg-reconfigure -f noninteractive tzdata
    fi
}

setTimeZone
service fail2ban stop
service fail2ban start
tailf /var/log/fail2ban.log