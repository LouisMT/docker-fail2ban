FROM alpine:latest
MAINTAINER goudcode <development@goudcode.nl>

RUN apk update
RUN apk add fail2ban bash

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY jail.local /etc/fail2ban/
COPY filter.d/ /etc/fail2ban/filter.d/
COPY action.d/ /etc/fail2ban/action.d/

ENTRYPOINT ["/entrypoint.sh"]
