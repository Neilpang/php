# php

php with apache, and mysql connector

http server:

```sh
docker run --rm -itd  \
  -v /data/web/example.com/:/var/www/html/ \
  --name web \
  -p 80:80 \
  neilpang/php:5
```

https server:

```sh
docker run --rm -itd  \
  -v /data/web/example.com/:/var/www/html/ \
  --name web \
  -p 80:80 \
  -p 443:443 \
  -e SSL_HOST_NAMES=example.com,www.sellmi.com \
  neilpang/php:5
```

