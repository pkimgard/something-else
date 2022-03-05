# My kali virtualbox setup

Remember/How-to of my basic setup/new install of kali from a freshly downloaded image. Takes about 30mins if your quick.

- https://www.kali.org/get-kali/#kali-virtual-machines

## Import

Import the downloaded image, change name, modify cpu and memory allocation.

## Initial setup

Start the VM, default credentials are kali/kali.

Under keyboard settings, delete english and add your own.

Update the system.

```
sudo apt update; sudo apt upgrade -y
# This throws an dependency error in the 2022.1 image. Try this:
sudo apt full-upgrade --auto-remove

reboot

# Change local timezone
sudo ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime

# A bunch of folders I'm used to
mkdir tmp opt tools machines vboxshare repos

# Give kali user permissions to use vbox shares
usermod -a -G vboxsf kali

# vi-mode for zsh
echo "bindkey -v" >> .zshrc

# change password for user
passwd kali

shutdown now
```

Connect shares to folders.

Excellent time to take a snapshot.

## Applications

### From repos

```
sudo apt install $(cat apt-pkg.txt)
```

- Use vim config in resources folder, copy to `.vimrc`.
- Use terminator config in resources folder, make dir .config/terminator and copy to `~/.config/terminator/config`.
- Bind 'Super L + Shift + S' to `flameshot gui`.

Change default terminal to terminator and browser to firefox.

Log in to firefox.

#### Panel

Remove terminals from app launcher, add atom(--no-sandbox if needed).

### Atom

- https://flight-manual.atom.io/getting-started/sections/installing-atom/

```
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -

sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

sudo apt-get update

sudo apt install atom
```

I write all docs in markdown so I use:
- language markdown
- markdown-writer
- markdown-img-paste
- markdown-preview-plus

Don't restore on start: Check 'Core - Open Empty Editor On Start' and set 'Core - Restore Previous Windows On Start' to 'no'.

## Tweaks

- Window manager - focus follows mouse.
- Scaled mode on machine window.
