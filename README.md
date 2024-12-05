# Ansible Automation Project

## Overview
This Ansible project provides infrastructure as code (IaC) for managing and deploying our systems.

## Prerequisites
- Ansible 2.9+
- Python 3.7+
- SSH access to target hosts

## Project Structure
- `inventory/`: Host and group variables
- `playbooks/`: Main Ansible playbooks
- `roles/`: Reusable role configurations
- `scripts/`: Supporting utility scripts

## Getting Started
1. Install Ansible: `pip install ansible`
2. Configure SSH keys
3. Verify inventory: `ansible-inventory --list`
4. Run main playbook: `ansible-playbook playbooks/main.yml`

## Roles
- `common`: Base configuration for all servers
- `webserver`: Web server setup and configuration
- `database`: Database server configuration

## Inventory Management
Edit `inventory/hosts` to define your server groups and hosts.

## Security Notes
- Always use vault for sensitive information
- Limit SSH access
- Regularly update configurations
