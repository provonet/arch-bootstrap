Arch bootstrap
=========

Role to bootstrap an Arch linux installation

Requirements
------------
This role assumes that you started the fresh box with the arch-boot iso
(https://www.archlinux.org/download/)

You can tune the installation by overwriting the defauls the role variables in your're playbook. 

Role Variables
--------------
<pre><code>
    disk: /dev/sda
    part:
      1:
        size: 2
        type: bios_grub
      2:
        size: 300MiB
        fstype: ext4
        dev: "{{ disk }}2"
      3:
        size: 25GiB
        type: lvm
        dev: "{{ disk }}3"
      4:
        size: -1
        type: lvm
        dev: "{{ disk }}4"
    lvm:
      vg:
        system:
          name: system
          dev: "{{ disk }}3"
          lv:
            swap:
              name: swap
              size: 8g
              fstype: swap
              dev: /dev/mapper/system-swap
            root:
              name: root
              size: +100%FREE
              fstype: f2fs
              dev: /dev/mapper/system-root
        data:
          name: data
          dev: "{{ disk }}4"
          lv:
            home:
              name: home
              size: +100%FREE
              fstype: f2fs
              dev: /dev/mapper/data-home
</code></pre>

Example Playbook
----------------
<pre><code>
- hosts: newserver
  vars:
    hostname: archbox
    domain: mydomain.org
    root_password: secret
    locale:
      region: Europe
      city: Amsterdam
      roles:
         - arch-bootstrap
</code></pre>

License
-------

BSD

Author Information
------------------
12-12-2016: Johan Bakker