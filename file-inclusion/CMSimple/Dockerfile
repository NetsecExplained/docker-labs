FROM "php:5-apache"

EXPOSE 80 

RUN apt-get update && apt-get install zip wget -y
RUN wget https://www.cmsimple.org/downloads_cmsimple50/CMSimple_5-4.zip
RUN unzip CMSimple_5-4.zip && rm CMSimple_5-4.zip
RUN mv CMSimple_5-4/* ./ && mv CMSimple_5-4/.[a-z]* ./  && rmdir CMSimple_5-4
RUN chown www-data:www-data -R *

CMD ["apachectl", "-D", "FOREGROUND"]
