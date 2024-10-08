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
