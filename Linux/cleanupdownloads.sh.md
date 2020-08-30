#!/bin/bash

# Clean up temp directories
rm -rf /tmp/*
rm -rf /var/tmp/*	

# Clean up downloads directories
rm -rf /Downloads/*

# Clear apt cache
apt clean -y

# Clear thumbnail cache Matt
rm -rf /home/Matt/.cashe/thumbnails
