#!/bin/bash

TIMTEC_USER=vagrant

# useradd -U -m ${TIMTEC_USER}

sudo apt-get update
sudo apt-get install -y libpq-dev libjpeg-dev libpng12-dev build-essential python-dev gettext python-virtualenv nodejs npm git

sudo ln -s /usr/bin/nodejs /usr/local/bin/node

# Database
# For timtec main project, we use postgresql to simulate prodution enviroment
# TODO: the developer version should use lighter databases, like sqlite.

sudo apt-get install -y postgresql
sudo su - postgres -c "createuser -d ${TIMTEC_USER}"
createdb timtec

./timtec/scripts/env-setup.sh
./timtec/scripts/production-ubuntu.sh