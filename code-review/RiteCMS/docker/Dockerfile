FROM php:7.4-apache

# Debian bullseye has aged out of deb.debian.org's live security repo, so
# apt-get update against it 404s. Pin to a frozen snapshot.debian.org
# mirror instead, which keeps working indefinitely (this is a fixed-in-time
# vulnerable lab image, so we don't want live/rolling package updates anyway).
RUN sed -i \
        -e '/snapshot.debian.org/s/^# //' \
        -e '/^deb http:\/\/deb.debian.org/s/^/# /' \
        /etc/apt/sources.list \
    && echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libsqlite3-dev \
        libpng-dev \
        libjpeg62-turbo-dev \
        libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_sqlite gd \
    && a2enmod rewrite access_compat

# RiteCMS relies on the .htaccess RewriteRules and on legacy
# "deny from all" directives (Apache 2.2 syntax) taking effect.
RUN sed -ri -e 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www/html

ENTRYPOINT ["entrypoint.sh"]
CMD ["apache2-foreground"]
