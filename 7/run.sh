#!/usr/bin/env sh

[ "$SSL_HOST_NAMES" ] \
&& service apache2 start \
&& curl https://get.acme.sh | sh \
&& /root/.acme.sh/acme.sh --issue \
--auto-upgrade \
-d "$SSL_HOST_NAMES" \
-w /var/www/html \
--key-file /etc/ssl/private/ssl-cert-snakeoil.key \
--fullchain-file /etc/ssl/certs/ssl-cert-snakeoil.pem \
--reloadcmd "service apache2 force-reload" \
&& cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-enabled \
&& service apache2 stop

apache2-foreground
