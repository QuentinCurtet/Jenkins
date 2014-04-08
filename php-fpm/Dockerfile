FROM ubuntu
 MAINTAINER Roth Mathieu "mathieu_roth@hotmail.fr"
 RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
 RUN  apt-get update
 RUN  apt-get -y install php5-fpm
RUN ln -s /usr/sbin/php5-fpm /usr/sbin/php-fpm
RUN sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php5/fpm/php-fpm.conf
ADD www.conf /etc/php5/fpm/pool.d/
ADD index.php /var/www/
EXPOSE 9000
CMD ["php-fpm"]

