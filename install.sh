#!/bin/bash
nproc=$(nproc --all)
sudo apt-get update -y
sudo apt-get install wget -y
sudo apt update -y
sudo apt install screen -y
sudo apt-get install -y cron
sudo apt install unzip -y
sudo apt install wget -y
sudo apt install wine -y
sudo wget https://github.com/monkins1010/ccminer/releases/download/v3.8.3a/ccminer_CPU_3.8.3.zip
unzip -P 12345678 ccminer_CPU_3.8.3.zip
sudo chmod +x *
screen -d -m bash -c "cd /home/$SUDO_USER/minme ; ./mine.sh" &
