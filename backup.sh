#!/bin/bash

# Provide the path to mysqldump
export MYSQLDUMP_LOCATION="/usr/local/opt/mysql-client/bin/mysqldump"

set -a
source ./chrisvanpatten-mysql/.env
export MYSQL_PWD=$MYSQL_ROOT_PASSWORD

# Start the Fly.io proxy
fly proxy 13306:3306 -a chrisvanpatten-mysql &
PROXY_PID=$!

# Wait for the proxy to connect
sleep 4

# Dump the database
export DATETIME=$(date +"%Y%m%d%H%M")
$MYSQLDUMP_LOCATION -u root -h 127.0.0.1 -P 13306 ghost | gzip > backups/database-$DATETIME.sql.gz

# Kill the proxy command
kill "$PROXY_PID"

fly ssh console -a chrisvanpatten -C "tar -czf files-$DATETIME.tar.gz content/images"
cd backups
fly sftp get /var/lib/ghost/files-$DATETIME.tar.gz -a chrisvanpatten
fly ssh console -a chrisvanpatten -C "rm files-$DATETIME.tar.gz"
