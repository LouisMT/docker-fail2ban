FROM alpine:latest
LABEL maintainer "goudcode <development@goudcode.nl>"

RUN apk add --no-cache fail2ban tzdata

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN rm /etc/fail2ban/jail.d/alpine*

COPY jail.local /etc/fail2ban/
COPY jail.d/ /etc/fail2ban/jail.d/
COPY filter.d/ /etc/fail2ban/filter.d/
COPY action.d/ /etc/fail2ban/action.d/

ENTRYPOINT ["/entrypoint.sh"]
