#!/bin/bash

# Update package lists
sudo apt update

# Install OpenSSH server and SFTP package
sudo apt install ssh -y

config_file="/etc/ssh/sshd_config"

# Line to be added
line1="Match group sftp"
line2="ChrootDirectory /home"
line3="X11Forwarding no"
line4="AllowTcpForwarding no"
line5="ForceCommand internal-sftp"

# Append lines to the config file
sudo echo "$line1" >> "$config_file"
sudo echo "$line2" >> "$config_file"
sudo echo "$line3" >> "$config_file"
sudo echo "$line4" >> "$config_file"
sudo echo "$line5" >> "$config_file"

# Restart SSH service
sudo service ssh restart

# Create a group for SFTP-only users
sudo groupadd sftp

# add user to group sftp
sudo useradd -m ccs2 -g sftp

# Set password for account
echo "ccs2:abc123!" | sudo chpasswd

# Change file permissions of home folder
sudo chmod 700 /home/ccs2

echo "----------------------------"
echo "SFTP installation completed."