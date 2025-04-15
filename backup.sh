#!/bin/bash

# Provide the path to mysqldump
export MYSQLDUMP_LOCATION="/usr/local/opt/mysql-client/bin/mysqldump"

set -a
source ./chrisvanpatten-mysql/.env
export MYSQL_PWD=$MYSQL_ROOT_PASSWORD

# Start the Fly.io proxy
flyctl proxy 13306:3306 -a chrisvanpatten-mysql &
PROXY_PID=$!

# Wait for the proxy to connect
sleep 4

# Dump the database
export DATETIME=$(date +"%Y%m%d%H%M")
$MYSQLDUMP_LOCATION -u root -h 127.0.0.1 -P 13306 ghost | gzip > ghost-$DATETIME.sql.gz

# Kill the proxy command
kill "$PROXY_PID"
