#!/bin/bash
set -e

DATADIR=/var/lib/mysql
SOCKET=/run/mysqld/mysqld.sock

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld "$DATADIR"

if [ ! -d "$DATADIR/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mariadb-install-db --user=mysql --datadir="$DATADIR" --skip-test-db >/dev/null
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

# Match config.php: root user, no password, connecting via "localhost" (socket)
mysql --socket="$SOCKET" -u root <<'SQL'
ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('');
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS cms_db;
SQL

# Seed schema/data only on first run (empty database)
TABLE_COUNT=$(mysql --socket="$SOCKET" -u root -N -B -e "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='cms_db';")
if [ "$TABLE_COUNT" -eq "0" ]; then
    echo "Importing database/cms_db.sql..."
    mysql --socket="$SOCKET" -u root cms_db < /var/www/html/cms/database/cms_db.sql
fi

chown -R www-data:www-data /var/www/html/cms/uploads

echo "Starting Apache..."
exec apache2-foreground
