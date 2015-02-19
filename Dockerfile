FROM ytnobody/debian-perl
MAINTAINER dokechin <>

RUN sudo apt-get install -y sqlite3
RUN cpanm Mojolicious Starlet Teng DBI DBD::SQLite
RUN mkdir /sqli
ADD log         /sqli/log
ADD sql         /sqli/sql
ADD templates   /sqli/templates
ADD lib         /sqli/lib
ADD public      /sqli/public
ADD sqli.config /sqli
ADD sqli.psgi   /sqli


WORKDIR /sqli
RUN sqlite3 sqli.db --init ./sql/create.sql
EXPOSE 5000
ENTRYPOINT ["plackup -e production --port 5000 ./sqli.psgi"]
