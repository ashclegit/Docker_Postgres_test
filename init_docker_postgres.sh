#!/bin/bash

# this script is run when the docker container is built
# it imports the base database structure and create the database for the tests

echo "*** CREATING DATABASE ***"

export PGUSER=postgres
psql <<- EOSQL
    CREATE USER docker;
    CREATE DATABASE omop_postgres;
    GRANT ALL PRIVILEGES ON DATABASE omop_postgres TO docker;
    \connect omop_postgres
    \i /tmp/psql_data/omop_ddl.sql	
EOSQL

echo "*** DATABASE CREATED! ***"
