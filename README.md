# chrisvanpatten.com

My personal blog and Ghost starter for fly.io.

```
$ cp chrisvanpatten/.env.example chrisvanpatten/.env
$ cp chrisvanpatten-mysql/.env.example chrisvanpatten-mysql/.env
# Update your secrets files
$ cd chrisvanpatten && ./launch.sh
$ cd ../chrisvanpatten-mysql && ./launch.sh
$ cd .. && ./deploy.sh
```

## SSH

```
# Set up SSH credentials in your ssh-agent
$ flyctl ssh issue --agent

# List all machines in an app
$ fly machine list -a chrisvanpatten

# Connect to a machine
$ flyctl ssh console -a chrisvanpatten [machine]
```

## MySQL

```
# Forward the MySQL app port locally
$ flyctl proxy 13306:3306 -a chrisvanpatten-mysql

# Connect from your preferred interface of choice (mysql CLI, TablePlus, etc)
```

## SSL & Domains

```
$ fly ips list -a chrisvanpatten
# Set A record for domain from machine IP, cname www to chrisvanpatten.fly.dev

$ flyctl certs create chrisvanpatten.com
$ flyctl certs create www.chrisvanpatten.com
# Get more domain records, including validation-only CNAMEs, from the fly.io UI

# Update .env with new domain
$ cat ./chrisvanpatten/.env | flyctl secrets import -a chrisvanpatten
```
