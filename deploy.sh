#!/bin/bash

cat ./chrisvanpatten/.env | flyctl secrets import -a chrisvanpatten
cat ./chrisvanpatten-mysql/.env | flyctl secrets import -a chrisvanpatten-mysql

flyctl deploy -c ./chrisvanpatten/fly.toml
flyctl deploy -c ./chrisvanpatten-mysql/fly.toml
