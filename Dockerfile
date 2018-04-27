FROM python:2-alpine3.7
LABEL maintainer "goudcode <development@goudcode.nl>"

ENV FAIL2BAN_VERSION=0.10.3.1

RUN apk add --no-cache iptables ip6tables tzdata && \
    pip install pyinotify dnspython && \
    wget https://github.com/fail2ban/fail2ban/archive/${FAIL2BAN_VERSION}.tar.gz && \
    tar xzf ${FAIL2BAN_VERSION}.tar.gz && \
    cd fail2ban-${FAIL2BAN_VERSION} && \
    python setup.py install && \
    cd .. && \
    rm -rf ${FAIL2BAN_VERSION}.tar.gz fail2ban-${FAIL2BAN_VERSION}

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY jail.local /etc/fail2ban/
COPY jail.d/ /etc/fail2ban/jail.d/
COPY filter.d/ /etc/fail2ban/filter.d/
COPY action.d/ /etc/fail2ban/action.d/

ENTRYPOINT ["/entrypoint.sh"]
