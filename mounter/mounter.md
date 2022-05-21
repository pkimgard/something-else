# mounter

Inital problem/situation: I **sometimes** want to mount several SMB shares with special options. Started scripting it and ended up with this.

Solution: Script that creates folder neccessary and an unmounting script that deletes then when done. Checks for not root, write permissions.

## Requirements

SMB support, if you have smbclient you should be fine.

## Usage
Change variables it top of script.

Don't run as root, it will ask for sudo when/if needed.

```
bash mounter.sh
./umountsh
```

## Bugs
- Pandoc errors display
