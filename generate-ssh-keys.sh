#!/bin/bash

ssh-keygen -t rsa -b 4096 -C "igor.mykhaylyuk@dat.com" -N "" -f ~/.ssh/id_rsa_dat
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa_dat
