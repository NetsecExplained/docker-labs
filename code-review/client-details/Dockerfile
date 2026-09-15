FROM php:5.6-apache

# This app is "Client Details System" (Kashipara/Oretnom23) -- a deliberately
# vulnerable PHP app for lab use: unauthenticated SQL injection in login.php
# (raw $_POST concatenated into a query via the old mysql_query() API) and
# unrestricted file upload in create.php (move_uploaded_file() with no
# extension/type checks). login.php still calls mysql_query()/mysql_fetch_array(),
# which PHP removed entirely in 7.0, so this container is pinned to PHP 5.6 on
# purpose to keep that vulnerability intact -- don't bump the base image without
# also patching the app to mysqli.

# php:5.6-apache is Debian stretch, which is EOL: deb.debian.org no longer serves
# it at all, and archive.debian.org's Release files are signed with expired keys,
# so mark the archive sources unauthenticated and skip the valid-until check.
RUN cat > /etc/apt/sources.list <<'EOF'
deb [check-valid-until=no trusted=yes] http://archive.debian.org/debian stretch main
deb [check-valid-until=no trusted=yes] http://archive.debian.org/debian-security stretch/updates main
EOF

# The app hardcodes DB_SERVER=localhost with an empty-password root user
# (dbconnection.php / admin/dbconnection.php), so PHP/Apache and MariaDB run
# together in this one container.
RUN apt-get update \
    && apt-get install -y --no-install-recommends mariadb-server \
    && rm -rf /var/lib/apt/lists/*

# mysqli covers every query in the app except login.php/admin's checklogin flow,
# which needs the old mysql extension.
RUN docker-php-ext-install mysqli mysql

# The PHP build has no compiled-in default socket path, and it doesn't match
# mysqld_safe's actual socket location -- point both at it explicitly. login.php
# calls mysql_query() with no link argument, so it implicitly opens its own
# connection via mysql_connect() with no args -- give the old ext the same
# root/no-password credentials dbconnection.php uses explicitly for mysqli,
# or that implicit connection fails auth.
RUN { \
        echo 'mysqli.default_socket=/run/mysqld/mysqld.sock'; \
        echo 'mysql.default_socket=/run/mysqld/mysqld.sock'; \
        echo 'mysql.default_user=root'; \
        echo 'mysql.default_password='; \
    } > /usr/local/etc/php/conf.d/mysql-socket.ini

# App source is committed in this directory alongside the Docker tooling --
# copy it straight in rather than fetching it. No DocumentRoot change needed:
# the app's PHP files already live at the repo root, matching Apache's default.
WORKDIR /var/www/html
COPY . .

# Pull the entrypoint out to its normal system location, then drop the
# Docker-only files from the webroot copy so they aren't served as static files
# alongside the app.
RUN cp docker/entrypoint.sh /usr/local/bin/entrypoint.sh \
    && chmod +x /usr/local/bin/entrypoint.sh \
    && rm -rf Dockerfile docker-compose.yml docker

EXPOSE 80
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
