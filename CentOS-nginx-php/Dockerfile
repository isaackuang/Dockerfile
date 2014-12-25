FROM centos:centos7
MAINTAINER J.Berg contact@mceith.com
RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN yum install epel-release -y
RUN yum update -y && yum install nginx php-fpm php-mysql -y
#RUN mkdir /var/wwwlogs
# Copy the original settigs. Note that the files must be inside the build directory.
#COPY config/nginx.conf /etc/nginx/nginx.conf
#COPY config/sites-enabled /etc/nginx/sites-enabled
#COPY sites-available /etc/nginx/sites-available
#COPY conf.d /etc/nginx/conf.d
ADD run.sh /run.sh
RUN chmod +x /run.sh
# Do not start nginx as daemon.
RUN sed -i '1 i\daemon off;' /etc/nginx/nginx.conf
RUN sed -ie 's/apache/nginx/g' /etc/php-fpm.d/www.conf

#RUN mkdir -p /var/www/html
#COPY config/html /var/www/html
#RUN chown -R nginx.nginx /var/www/html
# Match user id with running system for php-fpm.

VOLUME ["/usr/share/nginx/html"]

EXPOSE 80
ENTRYPOINT /run.sh
