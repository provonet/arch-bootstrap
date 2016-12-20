#!/bin/bash
PASSWORD='{{ root_password }}'
echo "root:${PASSWORD}" | /usr/sbin/chpasswd -e -R /mnt
