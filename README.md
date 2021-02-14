#docker-squid-e2guardian-rpi
======================
This is a docker container made for x86 that contains a squid proxy with SSL bump and e2guardian together.
It is based on both e2guardian and syakesaba/docker-sslbump-proxy.
I created this combination docker container to simplify the internal networking needed for ICAP.

Baseimage
======================
debian:stretch

### Quickstart 
```bash
docker run --name e2guardian -d --restart=always \
  --publish 3128:3128 \
  --volume /path/to/e2gaurdian/lists:/etc/e2guardian/lists \
  --volume /path/to/squid/conf:/etc/squid \
  jusschwa/docker-squid-e2guardian:<tag>
```

