#!/bin/bash
set -e

# RiteCMS writes SQLite databases, cache files, uploaded media and
# files at runtime. The code is bind-mounted from the host, so make
# sure the writable directories/files are actually writable by the
# www-data user in the container (SQLite also needs write access to
# the directory a .db file lives in, to create journal/wal files).
for dir in /var/www/html/data /var/www/html/media /var/www/html/files; do
  if [ -d "$dir" ]; then
    chmod -R 777 "$dir" || true
  fi
done

exec docker-php-entrypoint "$@"
