#!/bin/bash

echo "Checking USERNAME: "  +  `whoami` 

# assume system user ID is 1000
sudo mkdir -p /run/user/1000 
sudo chown $(id -u):$(id -g) /run/user/1000
sudo chmod 0700 /run/user/1000