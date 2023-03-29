FROM	debian:buster

RUN	apt-get update -y

RUN	apt-get upgrade -y

RUN	apt-get install mariadb-server -y

COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY	conf/script.sh /script.sh

RUN     chown -R mysql:mysql /var/lib/mysql/*
RUN     chmod 777 -R /var/lib/mysql/*


ENTRYPOINT	["bash", "script.sh"]

CMD     ["mysqld_safe"]
