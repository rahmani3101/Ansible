#!/bin/bash

# Comprehensive Ad-hoc Command Exploration

# 1. Basic Connectivity Check
echo "=== Connectivity Check ==="
ansible all -m ping

# 2. System Information Gathering
echo -e "\n=== System Facts ==="
ansible all -m setup -a "filter=ansible_distribution"

# 3. Package Management
echo -e "\n=== Package Installation ==="
ansible webservers -m apt -a "name=nginx state=present" -b

# 4. Service Management
echo -e "\n=== Service Status ==="
ansible webservers -m service -a "name=nginx state=started" -b

# 5. File Operations
echo -e "\n=== File Creation ==="
ansible webservers -m file -a "path=/opt/test state=directory mode=0755" -b

# 6. User Management
echo -e "\n=== User Creation ==="
ansible webservers -m user -a "name=deploy state=present" -b

# 7. Shell Command Execution
echo -e "\n=== Shell Command ==="
ansible webservers -m shell -a "echo 'Hello from $(hostname)'"
