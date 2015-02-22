FROM ytnobody/debian-perl
MAINTAINER dokechin <>

RUN apt-get install -y sqlite3
RUN cpanm Mojolicious Starlet Plack Teng DBI DBD::SQLite -f 
RUN mkdir /sqli
RUN mkdir /sqli/log
ADD sql         /sqli/sql
ADD templates   /sqli/templates
ADD lib         /sqli/lib
ADD public      /sqli/public
ADD sqli.config /sqli/
ADD app.psgi   /sqli/


WORKDIR /sqli
RUN sqlite3  -init ./sql/create.sql sqli.db
EXPOSE 5000
ENTRYPOINT ["plackup"]
