#!/bin/bash

# Update the system
sudo apt update -y
sudo apt upgrade -y
sudo apt software-properties-common -y
sudo apt-add-repository --yes --update ppa:ansible/ansible

# Install Ansible
sudo apt install -y ansible
