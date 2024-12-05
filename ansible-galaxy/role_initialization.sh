#!/bin/bash

# Create a new Ansible Galaxy role
ansible-galaxy role init my_web_server_role

# Navigate to role directory
cd my_web_server_role

# Edit meta information
cat << EOF > meta/main.yml
---
galaxy_info:
  author: Your Name
  description: Web Server Configuration Role
  platforms:
    - name: Ubuntu
      versions:
        - focal
        - jammy
  galaxy_tags:
    - web
    - nginx
    - server

dependencies: []
EOF

# Create a basic task
cat << EOF > tasks/main.yml
---
- name: Install web server packages
  package:
    name: 
      - nginx
      - apache2
    state: present

- name: Configure web server
  template:
    src: server_config.j2
    dest: /etc/nginx/nginx.conf
EOF
