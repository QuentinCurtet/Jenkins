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

# Install Wordpress
ADD http://wordpress.org/latest.tar.gz /usr/share/nginx/latest.tar.gz
RUN cd /usr/share/nginx/ && tar xvf latest.tar.gz && rm latest.tar.gz

RUN rm -rf /usr/share/nginx/www
RUN mv /usr/share/nginx/wordpress /usr/share/nginx/www
RUN chown -R www-data:www-data /usr/share/nginx/www
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE 80

CMD ["/bin/bash", "/start.sh",nginx -c /etc/nginx/nginx.conf]

