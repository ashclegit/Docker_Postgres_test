# Dockerfile

FROM postgres:10
RUN mkdir -p /tmp/psql_data/

COPY ./db/omop_ddl.sql /tmp/psql_data/
COPY ./scripts/init_docker_postgres.sh /docker-entrypoint-initdb.d/
