#!/bin/sh

set -e

# Create socket directory
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# Initialize database if not exists
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB in background
mysqld --user=mysql --datadir=/var/lib/mysql &

sleep 5

# Create database and user if first run
if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
    echo "Creating database and user..."
    mysql -u root <<EOF
    CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
    CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
    FLUSH PRIVILEGES;
EOF
fi

wait