FROM ubuntu
 MAINTAINER Roth Mathieu "mathieu_roth@hotmail.fr"
 RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
 RUN sudo apt-get update
 RUN sudo apt-get install php5-fpm
RUN sed -i 's/;extension=gd.so/extension=gd.so/g' /etc/php/php.ini
RUN sed -i 's/;extension=iconv.so/extension=iconv.so/g' /etc/php/php.ini
RUN sed -i 's/;extension=mcrypt.so/extension=mcrypt.so/g' /etc/php/php.ini
RUN sed -i 's/;extension=mysql.so/extension=mysql.so/g' /etc/php/php.ini
RUN sed -i 's/;extension=sqlite3.so/extension=sqlite3.so/g' /etc/php/php.ini
RUN sed -i 's/;extension=pgsql.so/extension=pgsql.so/g' /etc/php/php.ini
RUN sed -i 's/;extension=ldap.so/extension=ldap.so/g' /etc/php/php.ini
EXPOSE 9000
ENTRYPOINT ["php-fpm","-F"]
