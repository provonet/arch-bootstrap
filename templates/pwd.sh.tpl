#!/bin/bash
PASSWORD='{{ root_password }}'
echo "root:${PASSWORD}" | arch-chroot /mnt /usr/sbin/chpasswd -e
