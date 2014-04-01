FROM ubuntu
 MAINTAINER Roth Mathieu "mathieu_roth@hotmail.fr"
 RUN echo deb http://archive.ubuntu.com/ubuntu precise universe >> /etc/apt/sources.list
 RUN  apt-get update
 RUN  apt-get -y install php5-fpm
 ENTRYPOINT ["php-fpm","-F"]
EXPOSE 9000
