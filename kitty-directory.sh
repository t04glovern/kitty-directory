#!/bin/bash

## Stop Systemctl service
sudo systemctl stop kitty-directory

## Git Pull
git pull

## Install pip requirements
WORKING_DIR=/home/nathan/Production/kitty-directory
ACTIVATE_PATH=/home/nathan/.virtualenvs/flask-python3.6.3-dev/bin/activate
cd ${WORKING_DIR}
source ${ACTIVATE_PATH}
pip install -r requirements.txt

## Restart Systemctl service
sudo systemctl start kitty-directory