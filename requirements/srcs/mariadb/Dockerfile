FROM debian:buster

RUN apt update -y && apt install -y mariadb-server

COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mariadb.sh /tmp/mariadb.sh


RUN chmod +x /tmp/mariadb.sh

EXPOSE 3306

CMD ["/tmp/mariadb.sh"]





