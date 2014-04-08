FROM ubuntu
MAINTAINER damien.duportal@gmail.com

RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y nano wget dialog net-tools
RUN apt-get install -y nginx

RUN rm -v /etc/nginx/nginx.conf
RUN mkdir -p /var/www
RUN echo "<h1>Hello World</h1>" > /var/www/index.html

ADD nginx.conf /etc/nginx/


EXPOSE 80
CMD nginx -c /etc/nginx/nginx.conf
