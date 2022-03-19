# Epson Network Scanner

For Arch Linux.

- https://archlinux.org/packages/community/x86_64/imagescan/
- https://aur.archlinux.org/packages/imagescan-plugin-networkscan
- https://wiki.archlinux.org/title/SANE/Scanner-specific_problems

```
sudo pacman -S imagescan

# Install imagescan-plugin-networkscan from AUR

# In '/etc/utsushi/utsushi.conf':
[devices]
myscanner.udi   = esci:networkscan://<IP-ADDRESS>:1865
myscanner.vendor = Epson
mysacnner.model = Model

utsushi
```

Scan away.
