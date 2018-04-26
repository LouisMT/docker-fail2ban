# docker-fail2ban
Usage:

```bash
docker run -dit \
    --name fail2ban \
    --restart unless-stopped \
    --net host \
    --privileged \
    -e TZ=UTC \
    -v /var/log:/var/log \
    docker-fail2ban:latest
```

Make sure to set `TZ` to match your host's timezone (for example `Europe/Amsterdam`), otherwise time matching will fail.
