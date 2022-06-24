# Linux Containers

- https://linuxcontainers.org/
- https://linuxcontainers.org/lxd/getting-started-cli/
- https://wiki.archlinux.org/title/Linux_Containers
- https://wiki.archlinux.org/title/LXD

## Installation

*If you don't have snap installed. *

```
sudo apt isntall snapd # Debian/Ubuntu/Kali
sudo pacman -S snapd # Arch

sudo systemctl enable snapd
reboot
```

```
sudo snap install lxd
sudo lxd init
```

## Using it

```
lxc
lxc --help
lxc list
lxc list type=container | type=vm
lxc list status=running | status=stopped
lxc info INSTANCE_NAME
lxc start | stop | restart INSTANCE_NAME
```

### Get a container running

```
lxc launch SERVER:IMAGE INSTANCE_NAME
lxc exec INSTANCE_NAME -- COMMAND
lxc exec INSTANCE_NAME -- /bin/bash
lxc exec INSTANCE_NAME -- su --login USERNAME
```

**Map a local folder to container**

```
lxc config device add CONTAINERNAME SHARENAME disk source=/HOST/FOLDER path=/CONTAINER/PATH
```

### Get a VM running

**Connect to a VGA console**

```
# Requries package: virt-viewer

lxc console VM_NAME --type=vga

# Detach:
CTRL+a q
```
