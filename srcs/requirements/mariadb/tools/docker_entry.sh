#!/bin/sh

set -e

mysqld --user=mysql --datadir=/var/lib/mysql &

sleep 4

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "intializing"
    mysql -u root <<EOF

    CREATE DATABASE IF NOT EXISTS $MY_SQL_DATABASE;
    CREATE USER IF NOT EXISTS '$MY_SQL_USER'@'%' IDENTIFIED BY '$MY_SQL_PASSWORD';
    GRANT ALL PRIVILEGES ON $MY_SQL_DATABASE.* TO '$MY_SQL_USER';
    FLUSH PRIVILEGES;

EOF

fi

wait