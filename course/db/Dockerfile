FROM postgres:9.3
ENV PGDATA=/var/lib/postgresql/data/pgdata
ENV POSTGRES_USER=goodaki
ENV POSTGRES_PASSWORD=goodaki
ADD ./sql /sql
ADD ./setup.sh /docker-entrypoint-initdb.d/00-setup.sh
