#!/usr/bin/env sh

[ "$SSL_HOST_NAMES" ] \
&& cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-enabled \
&& /root/.acme.sh/acme.sh --issue \
-d "$SSL_HOST_NAMES" \
-w /var/www/html \
--key-file /etc/ssl/private/ssl-cert-snakeoil.key \
--fullchain-file /etc/ssl/certs/ssl-cert-snakeoil.pem \
--reloadcmd "service apache2 force-reload"

apache2-foreground
