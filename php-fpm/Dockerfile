FROM ubuntu
 MAINTAINER Roth Mathieu "mathieu_roth@hotmail.fr"
 RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
 RUN  apt-get update
 RUN  apt-get -y install php5-fpm
RUN ln -s /usr/sbin/php5-fpm /usr/sbin/php-fpm
RUN sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php5/fpm/php-fpm.conf
ADD www.conf /etc/php5/fpm/pool.d/
ADD index.php /var/www/

# Install Wordpress
ADD http://wordpress.org/latest.tar.gz /usr/share/nginx/latest.tar.gz
RUN cd /usr/share/nginx/ && tar xvf latest.tar.gz && rm latest.tar.gz
RUN mv /usr/share/nginx/www/5* /usr/share/nginx/wordpress
RUN rm -rf /usr/share/nginx/www
RUN mv /usr/share/nginx/wordpress /usr/share/nginx/www
RUN chown -R www-data:www-data /usr/share/nginx/www
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE 80

CMD ["/bin/bash", "/start.sh"]

