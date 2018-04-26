#!/bin/bash
rm -f /var/run/fail2ban/*
fail2ban-server -b
tail -f /var/log/fail2ban.log
