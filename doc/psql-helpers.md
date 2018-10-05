# psql helpers

We work with PostgreSQL frequently

We have simple shell functions to help us inspect our PostgreSQL servers.

    psql_user_names() { psql -tAc "SELECT usename FROM pg_catalog.pg_user;" ; }
    psql_user_name_exist() { [ "$( psql -tAc "SELECT 1 FROM pg_catalog.pg_user WHERE usename='$1'" )" = '1' ] ; }
    psql_database_names() { psql -tAc "SELECT datname FROM pg_database;" ; }
    psql_database_name_exist() { [ "$( psql -tAc "SELECT 1 FROM pg_database WHERE datname='$1'" )" = '1' ] ; }
