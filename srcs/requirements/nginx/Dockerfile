FROM	debian:buster

RUN	apt-get update

RUN	apt-get upgrade -y

RUN	apt install nginx -y


RUN	mkdir -p /etc/nginx/ssl
RUN	apt-get install openssl -y
RUN	 openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=threiss.42.fr/UID=threiss"

COPY	conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE	443

RUN	chown -R www-data:www-data /var/www/html

CMD	[ "nginx", "-g", "daemon off;" ]
