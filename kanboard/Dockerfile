FROM ubuntu:trusty
MAINTAINER Isaac Tseng <isaac.kuang@gmail.com>

# Install base packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -yq install \
	unzip \
        curl \
        apache2 \
        php5-sqlite \
        php5-gd \
        php5-curl \
        php-pear \
        php-apc && \
    rm -rf /var/lib/apt/lists/*
RUN sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD kanboard-latest.zip /root/kanboard-la
RUN cd /root
RUN unzip kanboard-latest.zip
RUM mv kanboard /kanboard

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Configure /app folder with sample app
RUN rm -fr /var/www/html && ln -s /kanboard /var/www/html

VOLUME ['/kanboard/data']

EXPOSE 80
WORKDIR /kanboard
CMD ["/run.sh"]
