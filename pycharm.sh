#/usr/bin/bash
#
# Script:pycharm.sh
# Author: parttimehacker 
# Date:   November 2020 
# 
# Purpose:fresh install script for Raspberry Pi step 1 of 3 
# 
# Notes: get the latest packages and set up file sharing
# 
#!/bin/bash

echo "Welcome to DIY Installation Script for Raspbian"
echo "This script was modified from a script by LearnOpenCV.com"
echo "================================"
# Step 1: Update packages
echo -e "\nUpdating raspian packages\n"
sudo apt -y update
echo -e "\n2 of 4\n"
sudo apt-get -y update
echo -e "\n3 of 4\n"
sudo apt-get -y upgrade 
echo -e "\n4 of 4\n"
sudo apt-get -y dist-upgrade
sudo sync
echo "Updates and upgrade complete"
echo "================================"
echo
sudo sync

# Step 2: Mac file stuff
echo -e "\nInstall Mac file sharing\n"
sudo apt-get -y install avahi-daemon
echo -e "\n2 of 3\n"
sudo systemctl enable avahi-daemon.service
echo -e "\n3 of 3\n"
sudo apt-get -y install netatalk
sudo sync
echo -e "\navihi and netatalk installation complete"
echo "================================"
echo
sudo sync

# Step 3: Firewall security
echo "Install firewall installation"
sudo apt-get -y install ufw
sudo ufw allow 22
sudo ufw allow 548
sudo ufw allow 80
sudo ufw allow 5000
sudo ufw allow 5900
sudo ufw enable
sudo ufw status
sudo sync
echo "================================"
echo "Install firewall complete"
