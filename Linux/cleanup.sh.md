#!/bin/bash

# Clean up temp directories
rm -rf /tmp/*
rm -rf /var/tmp/*	

# Clear apt cache
apt clean -y

# Clear thumbnail cache for sysadmin, instructor, and student
rm -rf /home/sysadmin/.cache/thumbnails
rm -rf /home/instructor/.cache/thumbnails
rm -rf /home/student/.cache/thumbnails
rm -rf /root/.cache/thumbnails
05-Archiving-and-Logging-Data/Day 2/Activities/06_Introduction_to_Scripts/Solved/cleanup.sh