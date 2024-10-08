#!/bin/bash
sudo sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf
sudo curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh 2>&1 >> /tmp/log.txt
ii=$(grep -w ID /etc/os-release | awk -F= '{print $2}')
ver=$(grep -w VERSION_ID /etc/os-release | awk -F\" '{print $2}')
sudo wget https://packages.microsoft.com/config/$ii/$ver/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sleep 60
sudo dpkg -i packages-microsoft-prod.deb
sleep 30
sudo apt update
sudo apt-get install -y powershell
sudo snap install powershell --classic
sudo apt install -y default-jre
sudo apt install -y default-jdk
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo apt-get install -y nuget
sudo apt-get install -y dotnet-sdk-8.0
sleep 5
sudo apt-get install -y dotnet-host
sleep 5
sudo snap install --classic dotnet-sdk
sleep 5
sudo rm -rf packages-microsoft-prod.deb
sleep 20
sudo apt-get install -y zip

