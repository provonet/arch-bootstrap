
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
```yaml
hostname: NOTSET
domain: NOTSET
root_password: root
locale:
  region: Europe
  city: Amsterdam
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
```


Example Playbook
----------------
```yaml
-   hosts: all

    vars:
      hostname: archbox
      domain: mydomain.org
      root_password: secret
      locale:
        region: Europe
        city: Amsterdam

    pre_tasks:
    - name: clean roles directory
      local_action: file path=roles state=absent

    - name: run galaxy
      local_action: command ansible-galaxy install -r requirements.yml --roles-path roles

  roles:
    - arch-bootstrap
```



License
-------

BSD




Author Information
------------------
12-12-2016: Johan Bakker