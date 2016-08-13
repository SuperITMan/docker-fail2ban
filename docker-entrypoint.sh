#!/bin/bash

service fail2ban restart
tailf /var/log/fail2ban.log