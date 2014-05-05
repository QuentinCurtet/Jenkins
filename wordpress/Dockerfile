
FROM ubuntu
RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y nano wget dialog net-tools
RUN apt-get install -y nginx git vsftpd curl npm

RUN rm -v /etc/nginx/nginx.conf
RUN mkdir  /var/www/
RUN cd /var/www/; git clone https://github.com/WordPress/WordPress 


ADD nginx.conf /etc/nginx/
#ADD upstream.conf /etc/nginx/

EXPOSE 80
CMD nginx -c /etc/nginx/nginx.conf
