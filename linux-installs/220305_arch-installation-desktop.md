# Arch re-install on desktop

*2022-03-05*

- Backup files and prep usb drive according to laptop install.
- Boot usb-drive

## Main installation

1. Change keyboard layout and check internet connection.

```
loadkeys sv-latin1
ip a
```

2. Reformat root partition, save ¨swap and efi partition.

```
mkfs.ext4 /dev/nvme0n1p2
```

3. Mount drives/partitions to be used.

```
mount /dev/nvme0n1p2 /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
swapon /dev/nvme0n1p3
```

4. Install OS and basic packages

```
pacstrap /mnt base linux linux-firmware base-devel zsh grub efibootmgr os-prober networkmanager man-db man-pages texinfo vi vim terminator
```

5. Basic OS configurations

```
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
hwclock --systohc
```

Create and save '/etc/vconsole.conf':

```
KEYMAP=sv-latin1
```

Create and save '/etc/locale.conf':

```
sv_SE.UTF-8
```

Uncomment 'sv_SE.UTF-8' in '/etc/locales.gen'

```
locale-gen
```

Change hostname in '/etc/hostname'.

6. Update grub settings

(Still inside chroot environment)

Edit '/etc/default/grub' to your liking, I usually do:
- Remove quiet boot
- Change GFX setting from auto to fixed resolution.
- Set a background image
- Uncomment GRUB_DISABLE_OS_PROBER.

See 'grub' in 'recources'.

When done, run os-prober to make sure it finds all OS you want, you might have to mount the partitions. Then generate new config:

```
grub-mkconfig -o /boot/grub/grub.cfg
```

7. Change root password and reboot

```
passwd root
exit # Out of chroot env.
reboot
```

# Post-installation essentials

## Users and groups
Change USERNAME to your name.

```
useradd -s /usr/bin/zsh -m USERNAME
groupadd sudo
usermod -a -G sudo USERNAME
passwd USERNAME
visudo # Uncomment line to allow sudo group(line 88).
```

Log out with `exit` and log in as new user, try permissions with `sudo -l`.

If everything is working, lock root account:

```
sudo passwd -l root
```

## Network
```
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager
```

## Graphics and Sound

### Display manager and desktop environment

Removed: xf86-video-intel

```
sudo pacman S $(cat pac-x-de.txt)
sudo systemctl enable lightdm
reboot
```

XFCE settings:

- Appearance - Theme to adwaita-dark.
- Keyboard - Keyboard layout to swedish, remove english.
- Display - Crank up refresh rates, rotate seconde screen, adjust position.
- Window man - Focus follows mouse
- Window man - Keyboard, bind Super+arrows to tile windows.
- Change font to cantarell and fira code(monospace).
- Create and edit panels.

Save xrandr screen configuration.

```
autorandr -s default
```

Unzip truetype-fonts.zip to '/usr/share/fonts'.

#### Panels

## Aux applications

The rest of my goto apps now that the basics are up and running.

```
sudo pacman -S ${cat pac-aux.txt}
```

### Configurations

**Files**

Replace vimrc and zshrc in home folder.

Create folder '.config/terminator' and place terminator config in there.

**Firefox**

Log in, bookmarks always show.

**Atom**

(Change command to `--no-sandbox` if it's not starting.)

Change package spell-check locale to 'en-US'.

Install packages: language-markdown, markdown-writer, markdown-img-paste, markdown-preview-plus.

Don't restore on start: Check 'Core - Open Empty Editor On Start' and set 'Core - Restore Previous Windows On Start' to 'no'.

**Flameshot**

Bind 'Super L + Shift + S' to `flameshot gui`.

## Lightdm

Monitor settings:

```
sudo autorandr -s default
```

session-setup-script=autorandr -c default

Added backgroud:

bg.jpg in '/usr/share/pixmaps'

Todo: Make changes to x-server config to be more permanent.
