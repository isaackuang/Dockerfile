FROM ubuntu:trusty
MAINTAINER Isaac Tseng

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y nginx \
  php5-fpm php5-mysql php-apc php5-imagick php5-imap php5-mcrypt php5-gd libssh2-php

ADD config/nginx.conf /etc/nginx/nginx.conf
COPY config/sites-enabled /etc/nginx/sites-enabled
RUN sed -i -e 's/^listen =.*/listen = \/var\/run\/php5-fpm.sock/' /etc/php5/fpm/pool.d/www.conf

RUN mkdir -p /var/www.html

VOLUME ["/var/www/html"]

EXPOSE 80

ADD config/start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
