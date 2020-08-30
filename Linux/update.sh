#!/bin/bash 

# Ensure apt has att available updates 
apt update —Y 

# Upgrade atl installed packages 
apt upgrade —Y 

# Install new packages, and uninstall any old packages that 
# must be removed to install them 
apt full—upgrade —y

# Remove unused packages and their associated configuration files 
apt autoremove —purge —y 
 