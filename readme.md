# Create a Kali Linux Image With Docker

1.- modify the .env file accordingly, by default it has mdorozcog as username and password

2.- Create docker image and run container in the background.

```
docker-compose up -d
```

3.- Log into your new container and run the persist_db.sh just once to copy your PostgreSQL data into your host directory

```
ssh mdorozcog@127.0.0.1 -p 2222
su
#Enter your SU password. mdorozcog by default
. /usr/local/bin/persist_db.sh
```

And that's it! Now you have a working Kali Linux container.

To stop the container, simply run

```
docker-compose stop
```

To start the container again, you don't need to execute docker-compose up, instead you have to execute docker-compose start

Everytime you want to log in into your container, do it via SSH

```
ssh mdorozcog@127.0.0.1 -p 2222
```
