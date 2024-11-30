#!/bin/bash

# 1. File System Navigation
ls ~
cd /var/log && ls /var/log
which bash
echo $SHELL

# 2. File and Directory Operations
mkdir ~/linux_fundamentals
mkdir -p ~/linux_fundamentals/scripts
touch ~/linux_fundamentals/example.txt
cp ~/linux_fundamentals/example.txt ~/linux_fundamentals/scripts/example.txt
mkdir -p ~/linux_fundamentals/backup && mv ~/linux_fundamentals/scripts/example.txt ~/linux_fundamentals/backup
chmod 644 ~/linux_fundamentals/backup/example.txt
ls -l ~/linux_fundamentals/backup

# File Modification
touch ~/example.txt
sudo useradd -m student
sudo chown student ~/example.txt
sudo addgroup students
sudo chgrp students ~/example.txt
ls -l ~/example.txt

# 4. Ownership
mkdir ~/project
touch ~/project/report.txt
chmod 644 ~/project/report.txt
chmod 755 ~/project
ls -la ~/project

# 5. User Add/Modify
sudo useradd -m -d /home/developer_home -s /bin/sh developer
id developer
sudo usermod -l devuser developer
sudo groupadd devgroup
sudo usermod -aG devgroup devuser
echo "devuser:devpass" | sudo chpasswd
id devuser

# 6. Hard/Soft Link
touch ~/original.txt
ln -s ~/original.txt ~/softlink.txt
ls -l ~/softlink.txt
rm ~/original.txt && ls -l ~/softlink.txt
touch ~/datafile.txt
ln ~/datafile.txt ~/hardlink.txt
ls -l ~/hardlink.txt
ls -i ~/datafile.txt ~/hardlink.txt
rm ~/datafile.txt && ls -l ~/hardlink.txt
find ~/* -type f -name "*.txt"

# 7. Package Installation
sudo apt-get update
sudo apt-get install -y tree
sudo apt-get install apt-transport-https ca-certificates gnupg curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-cli
gcloud init