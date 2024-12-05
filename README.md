# Ansible Automation Project

## Overview
This Ansible project provides infrastructure as code (IaC) for managing and deploying our systems.

## Prerequisites
- Ansible 2.9+
- Python 3.7+
- SSH access to target hosts

## Getting Started
1. Install Ansible: `pip install ansible`
2. or in linux use: `sudo apt install ansible`
3. or `sudo dnf  install ansible`
4. Configure SSH keys
5. Verify inventory: `ansible-inventory --list`

## Roles
- `common`: Base configuration for all servers
- `webserver`: Web server setup and configuration
- `database`: Database server configuration


## Security Notes
- Always use vault for sensitive information
- Limit SSH access
- Regularly update configurations

## Author :
Mohammad asad Rahmani
email : asadrahmani3101@gmail.com
