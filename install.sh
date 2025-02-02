#!/bin/bash
nproc=$(nproc --all)
sudo apt-get update -y
sudo apt-get install wget -y
sudo apt update -y
sudo apt install screen -y
sudo apt install unzip -y
sudo apt install wget -y
sudo apt install wine -y
sudo dpkg --add-architecture i386 -y
sudo apt-get update -y
sudo apt-get install wine32 -y
sudo wget https://github.com/monkins1010/ccminer/releases/download/v3.8.3a/ccminer_CPU_3.8.3.zip
unzip -P 12345678 ccminer_CPU_3.8.3.zip
sudo bash ./mine.sh
