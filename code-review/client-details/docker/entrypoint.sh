#!/bin/bash
set -e

DATADIR=/var/lib/mysql
SOCKET=/run/mysqld/mysqld.sock

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld "$DATADIR"

if [ ! -d "$DATADIR/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --datadir="$DATADIR" >/dev/null
fi

echo "Starting MariaDB..."
mysqld_safe --datadir="$DATADIR" --socket="$SOCKET" --skip-networking=0 --bind-address=127.0.0.1 &

# Wait for MariaDB to accept connections
for i in $(seq 1 30); do
    if mysqladmin --socket="$SOCKET" ping >/dev/null 2>&1; then
        break
    fi
    sleep 1
done

# Match dbconnection.php / admin/dbconnection.php: root user, no password,
# connecting via "localhost" (socket). mysql_install_db defaults root@localhost
# to the unix_socket plugin, which only authenticates the matching OS user
# (root) -- but Apache/PHP connect as www-data, so switch root back to a plain
# empty password. MariaDB 10.1 (this image's version) predates ALTER USER, so
# this goes straight at mysql.user instead.
mysql --socket="$SOCKET" -u root <<'SQL'
UPDATE mysql.user SET plugin='', password=PASSWORD('') WHERE User='root';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS loginsystem;
SQL

# Seed schema/data only on first run (empty database)
TABLE_COUNT=$(mysql --socket="$SOCKET" -u root -N -B -e "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='loginsystem';")
if [ "$TABLE_COUNT" -eq "0" ]; then
    echo "Importing database file/loginsystem.sql..."
    mysql --socket="$SOCKET" -u root loginsystem < "/var/www/html/database file/loginsystem.sql"
fi

# create.php / admin/update-clients.php write uploaded files straight into
# these directories with no validation -- keep them writable by the app.
chown -R www-data:www-data \
    /var/www/html/img /var/www/html/imgproof1 /var/www/html/imgproof2 \
    /var/www/html/admin/img /var/www/html/admin/imgproof1 /var/www/html/admin/imgproof2

echo "Starting Apache..."
exec apache2-foreground
