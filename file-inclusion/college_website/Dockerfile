FROM "php:5-apache"

EXPOSE 80 

COPY . /var/www/html

# Set php.ini file
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

RUN docker-php-ext-install mysqli

RUN chown www-data:www-data -R /var/www/html

CMD ["apachectl", "-D", "FOREGROUND"]
