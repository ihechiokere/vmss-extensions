#!/bin/bash
sudo curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh 2>&1 >> /tmp/log.txt
ii=$(grep -w ID /etc/os-release | awk -F= '{print $2}')
ver=$(grep -w VERSION_ID /etc/os-release | awk -F\" '{print $2}')
sudo wget https://packages.microsoft.com/config/$ii/$ver/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get install -y powershell
sudo snap install powershell --classic
sudo apt-get install -y zip
sudo apt install -y default-jre
sudo apt install -y default-jdk
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo apt-get install -y nuget
sudo apt-get install -y dotnet-sdk-8.0
sudo snap install --classic dotnet-sdk
rm packages-microsoft-prod.deb
sudo reboot
