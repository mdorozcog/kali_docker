#!/bin/bash

# move db directory to a persistent location 
cp -rp /var/lib/postgresql /var/lib/database

rm -rf /var/lib/postgresql

# create a symlink to the db directory
ln -s /var/lib/database/postgresql /var/lib/postgresql