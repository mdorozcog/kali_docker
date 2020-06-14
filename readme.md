# Create a Kali Linux Image With Docker

## Objectives

The current project will create a working image of Kali Linux with the followin packets:

- metasploit-framework
- nmap
- powersploit
- python- pip
- python3
- vim
- sudo
- openssh-server

## Required Apps

1. Docker
2. GIT

## Files Description

- database // PostgreSQL volume for Data persistence
- user // Home directory volume
- .env // Environment variables (username and password)
- create_user.sh // Bash script to generate user
- docker-compose.yml // Docker Compose configuration to ease the container management
- dockerfile // Script with all the setup commands to generate Kali image
- entrypoint.sh // Bash script to start SSH Server
- persist_db.sh // Bash script to copy PostgreSQL data into the database volume and make a symlink
- ssh_config // SSH host configuration
- sshd_config // SSH Server configuration

## Steps

1. Clone the repository and go to the project folder

```
git clone https://github.com/mdorozcog/kali_docker.git kali_docker
cd kali_docker
```

2. Customise settings. Inside the "dockerfile" add or remove packages according to your needs.

3. Create docker image and run container in the background.

```
docker-compose up -d
```

4. Log into your new container and run the persist_db.sh just once to copy your PostgreSQL data into your host directory

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

To start the container again, you don't need to execute docker-compose up, instead you have to execute `docker-compose start`

Everytime you want to log in into your container, do it via SSH

```
ssh mdorozcog@127.0.0.1 -p 2222
```
