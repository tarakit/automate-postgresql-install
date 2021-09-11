#!/bin/bash

# echo "update package to the latest"sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql-11

echo "Allowing port for PostgreSQL server"
sudo ufw allow 5432/tcp

sleep 2s
echo "Success Installed"

echo "login to postgres user and change pwd"
sudo -u postgres psql
# change your password here
alter user postgres with password '12345';
# exit from postgresql console
\q
# if it is found it will be modified the content with the flag of sed -i
# change from "localhost" to "*"
sudo sed -i 's/localhost/'*'/g' /etc/postgresql/11/main/postgresql.conf

echo "See pg_hba.conf file to addtional configuration"
grep pg_hba.conf /var/lib/pgsql/data/postgresql.conf

# change max connection for postgres
# service postgresql reload
# Check Postgres Status
sudo systemctl status postgresql