#!/bin/bash
curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
bash nodesource_setup.sh 2>&1 >> /tmp/log.txt
ii=$(grep -w ID /etc/os-release | awk -F= '{print $2}')
ver=$(grep -w VERSION_ID /etc/os-release | awk -F\" '{print $2}')
wget https://packages.microsoft.com/config/$ii/$ver/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt update
apt-get install -y powershell
snap install powershell --classic
apt-get install -y zip
apt install -y default-jre
apt install -y default-jdk
apt-get install -y nodejs
apt-get install -y npm
apt-get install -y nuget
apt-get install -y dotnet-sdk-8.0
apt-get install -y dotnet-host
snap install --classic dotnet-sdk
rm -rf packages-microsoft-prod.deb
reboot