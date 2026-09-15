FROM php:8.0-apache

# php:8.0-apache is Debian bullseye, which is past its archive cutoff -- deb.debian.org
# no longer serves bullseye-security live, so pin apt at a snapshot.debian.org date that
# still has it. (Without this, "apt-get install mariadb-server" 404s on a fresh pull.)
RUN sed -i \
        -e 's|^deb http://deb.debian.org/debian-security|deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20231120T000000Z|' \
        -e 's|^deb http://deb.debian.org/debian |deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20231120T000000Z |' \
        /etc/apt/sources.list

# The app hardcodes DB_SERVER=localhost with an empty-password root user (config.php /
# initialize.php), so PHP/Apache and MariaDB run together in this one container.
# -t bullseye avoids a broken bullseye-security pool entry for mariadb-server
RUN apt-get update \
    && apt-get install -y --no-install-recommends -t bullseye mariadb-server \
    && apt-get install -y --no-install-recommends \
        libpng-dev libjpeg-dev libzip-dev unzip curl \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install -j"$(nproc)" mysqli gd zip \
    && a2enmod rewrite headers \
    && sed -ri 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf \
    && sed -ri 's#DocumentRoot /var/www/html#DocumentRoot /var/www/html/cms#' /etc/apache2/sites-available/000-default.conf \
    && rm -rf /var/lib/apt/lists/*

# The PHP build's compiled-in default mysqli socket doesn't match mysqld_safe's actual socket path
RUN { \
        echo 'mysqli.default_socket=/run/mysqld/mysqld.sock'; \
        echo 'pdo_mysql.default_socket=/run/mysqld/mysqld.sock'; \
    } > /usr/local/etc/php/conf.d/mysql-socket.ini

# App source ("Simple Client Management System" by oretnom23) is committed in this
# directory alongside the Docker tooling -- copy it straight in rather than fetching it.
WORKDIR /var/www/html/cms
COPY . .

# Pull the entrypoint out to its normal system location, then drop the Docker-only
# files from the webroot copy so they aren't served as static files alongside the app.
RUN cp docker/entrypoint.sh /usr/local/bin/entrypoint.sh \
    && chmod +x /usr/local/bin/entrypoint.sh \
    && rm -rf Dockerfile docker-compose.yml docker .dockerignore README.md

# The vendor app hardcodes base_url to "http://localhost/cms/" with no port, so every
# redirect/link it builds drops whatever host port you mapped. Make it follow the
# actual request host instead -- the only vendor-file edit in this whole build.
# Apache's DocumentRoot is pointed at this cms/ subfolder above (see 000-default.conf
# sed), so the app is served from the host root and base_url drops the /cms suffix too.
RUN sed -i \
    "s|define('base_url','http://localhost/cms/')|define('base_url','http://'.\$_SERVER['HTTP_HOST'].'/')|" \
    initialize.php

EXPOSE 80
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
