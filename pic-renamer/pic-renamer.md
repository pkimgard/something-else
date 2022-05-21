# pic-renamer
Initial problem/situation: Pictures being named IMG_XXXX.jpg instead of the date/time they were taken, which makes a mess when you import pictures from several cameras/phones.

Solution: A script that extracts the 'DateTimeOriginal' exif tag if it exists and renames the file by it(YYYY-MM-DD_HH-MM-SS).

Two scripts:

**pic-renamer.sh**

For single file renaming or when confirmation before every change is needed.

**bulk-pic-renamer.sh**

Essentially the above script in a function, wrapped in a loop. Asks for confirmation before starting, writes a log file.

## Requirements

  - exiftool

### Arch

`sudo pacman -S perl-image-exiftool`

## Usage
### pic-renamer.sh
```bash
# Single file
bash pic-renamer.sh <picture filename>

# Multiple
for file in *.jpg; do bash pic-renamer.sh \$file; done
```

### bulk-pic-renamer.sh
1. Change the prefix variable at the top of the script to match your files.
2. Move to the directory where the files are located(if prefix was relative).
3. Execute.

```bash
bash bulk-pic-renamer.sh
```

## In the future
This script solved my problems this time. Would be fun to add support for more tags and video format.
