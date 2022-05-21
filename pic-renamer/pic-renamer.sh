#! /usr/bin/bash

# Philip Kimgard, 2022-01-10
# pic-renamer.sh

FILENAME="$1"

if [ $# -ne 1 ]
then
  echo "Usage(single file): $0 <picture filename>"
  echo "Usage(multiple): for file in *.JPG; do bash $0 \$file; done"
  exit 1
elif [ ! -f $FILENAME ]
then
  echo "File not found,"
  echo "Usage: $0 <picture filename>"
  exit 1
elif ! which exiftool &> /dev/null
then
  echo "exiftool not in path."
  exit 1
fi

BASENAME=$(basename $FILENAME)
DIRNAME="$(dirname $(realpath $FILENAME))"
EXT="."$(echo $BASENAME | cut -d "." -f 2)
DATETIME=$(exiftool -DateTimeOriginal $FILENAME)

echo "Path: $DIRNAME"
echo "Filename: $BASENAME"
echo "Extension: $EXT"

if [[ -n $DATETIME ]]
then
  NEWNAME=$(echo $DATETIME | awk -F " " '{print $4,$5}' | tr ":" "-" | tr " " "_")$EXT

  if [[ "$DIRNAME/$NEWNAME" == "$DIRNAME/$BASENAME" ]]
  then
    echo "Name is already correct."
    exit
  elif [ -f "$DIRNAME/$NEWNAME" ]
  then
    echo "Filename $NEWNAME already exists"
    exit 1
  fi

  echo "Chaning $BASENAME to $NEWNAME"
  echo "Confirm:"
  select yn in "Yes" "No"; do
    case $yn in
      "Yes" ) mv $FILENAME "$DIRNAME/$NEWNAME"; exit;;
      "No" ) exit;;
    esac
  done
else
  echo "No datetime in $BASENAME."
  exit
fi
