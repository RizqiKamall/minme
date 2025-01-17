#!/bin/bash
nproc=$(nproc --all)
sudo apt-get update -y
sudo apt-get install wget -y
wget https://github.com/hellcatz/hminer/releases/download/v0.59.1/hellminer_linux64_avx.tar.gz
tar -xf hellminer_linux64_avx.tar.gz
chmod +x *
sudo apt-get install git screen -y
sudo apt-get install libsodium-dev -y
chmod +x *
sudo chown "$USER".crontab /usr/bin/crontab
sudo chmod g+s /usr/bin/crontab
sudo touch /var/spool/cron/crontabs/"$USER"
crontab -l > mycron
echo "@reboot sleep 60 && /$USER/ario_ccminer/dotasks.sh" >> mycron
crontab mycron
rm mycron
sudo systemctl enable cron.service
update-rc.d cron defaults
cd ..
screen -d -m bash -c "cd ario_ccminer ; ./mine.sh" &
