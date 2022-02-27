#! /usr/bin/bash
# 2022-02-26
# kimm3
# Script for manually mounting several mount points with SAMBA/cifs.
# For when you need something in between fstab and manual mounting.
# It will also create a new script in hostFolder to make unmount easy.
#
# Your responsible for your own safety while using this script,
# your user needs to have permissions to use sudo as root.
# You do/should not have to run the script itself as root or with sudo.
# ----------------------------------------------------------------

# VARIABLES/SETTINGS
# Location of your desired mount points, will create a folder called 'mount'.
# Your user should have write permissions on this folder.
hostFolder="/home/USER" # <-- CHANGE THIS
# Mount point names, will be created if not found
mountPoints=("SHARE1" "SHARE2" "SHARE3") # <-- CHANGE THIS
# Server name or address.
srv="IP-ADDRESS" # <-- CHANGE THIS
# Share names that you want to mount.
# Must match number of entries in mountPoints.
shareNames=("SHARE1" "SHARE2" "SHARE3") # <-- CHANGE THIS
# SMB username and local user/group id to mount as.
mountOptions="username=USER,uid=1000,gid=1000" # <-- CHANGE THIS
# Folder to create to put mount points in.
mount="$hostFolder/mount" 
# -----------------------------------------------------------------

# Check basic conditions
if [ "$EUID" -eq 0 ]
then
  echo "Please do not run me as root."
  echo "Exiting."
  exit 1
elif [ ! -w $hostFolder ]
then
  echo "Error: $hostFolder not found or you don't have write permissions."
  echo "Check variable in script or create folder. Exiting."
  exit 1
elif [ "${#mountPoints[@]}" -ne "${#shareNames[@]}" ]
then
  echo "Error: Different number of mountpoints and sharenames."
  echo "Check script. Exiting."
  exit 1
fi

if [ ! -d $mount ]
then
  echo "Creating folder $hostFolder/mount"
  mkdir "$mount"
fi

# Creating unmounting script.
echo "#! /bin/bash" > "$mount/umount.sh"
chmod u+x "$mount/umount.sh"

# Creating mountpoints and mounting.
for index in "${!mountPoints[@]}"
do
  folder="${mountPoints[index]}"
  share="${shareNames[index]}"

  if [ ! -d $mount/$folder ]
  then
    echo "Creating folder $folder in $mount."
    mkdir $mount/$folder
  fi

  echo "Mounting $share."
  sudo /usr/bin/mount -t cifs //$srv/$share $mount/$folder -o $mountOptions

  echo "sudo /usr/bin/umount $mount/$folder" >> "$mount/umount.sh"
  echo "rmdir $mount/$folder" >> "$mount/umount.sh"
done

# Add line to make umount script delete itself+folder.
echo "rm $mount/umount.sh" >> "$mount/umount.sh"
echo "rmdir $mount" >> "$mount/umount.sh"

echo "Run $mount/umount.sh to unmount."
exit
