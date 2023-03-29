FROM	debian:buster

RUN	apt-get update

RUN	apt-get upgrade -y

RUN	apt-get -y install wget

RUN	apt-get install -y php7.3
RUN	apt-get install -y php-fpm
RUN	apt-get install -y php-mysql
RUN	apt-get install -y mariadb-client 

RUN	wget  https://wordpress.org/wordpress-6.0.tar.gz -P /var/www

RUN	cd /var/www && tar -xzf wordpress-6.0.tar.gz && rm wordpress-6.0.tar.gz

RUN	chown -R root:root /var/www/wordpress

COPY    ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN	chmod +x wp-cli.phar

RUN	mv wp-cli.phar /usr/local/bin/wp

COPY	conf/auto_config.sh auto_config.sh

ENTRYPOINT	["bash", "auto_config.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F"]
