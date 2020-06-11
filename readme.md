modify the .env file accordingly, by default it has mdorozcog as username and password

Create docker image and run container in the background.

```
docker-compose up -d
```

Log into your new container and run the persist_db.sh just once to copy your Postgres data into your persistent directory

```
ssh mdorozcog@127.0.0.1 -p 2222
su
. /usr/local/bin/persist_db.sh
```

To stop the container

```
docker-compose stop
```

To start the container again, you don't need to execute docker-compose up, instead you have to execute docker-compose start

Everytime you want to log into your container, you can do it via SSH ssh mdorozcog@127.0.0.1 -p 2222
