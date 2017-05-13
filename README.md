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

custom conf:

```sh
docker run --rm -itd  \
  -v /data/web/example.com/:/var/www/html/ \
  -v /data/conf/:/conf/
  --name web \
  -p 80:80 \
  neilpang/php:5
```


https server with letsencrypt:

```sh
docker run --rm -itd  \
  -v /data/web/example.com/:/var/www/html/ \
  --name web \
  -p 80:80 \
  -p 443:443 \
  -e SSL_HOST_NAMES=example.com,www.sellmi.com \
  neilpang/php:5
```

https server with custom cert and key:

```
docker run --rm -itd  \
  -v /data/web/example.com/:/var/www/html/ \
  --name web \
  -p 80:80 \
  -p 443:443 \
-v ./ssl/chain.pem:/etc/ssl/certs/ssl-cert-snakeoil.pem \
-v ./ssl/key.pem:/etc/ssl/private/ssl-cert-snakeoil.key \
  neilpang/php:5
```

