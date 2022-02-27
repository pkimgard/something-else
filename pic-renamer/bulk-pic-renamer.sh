#! /usr/bin/bash

# Philip Kimgard 2022-01-10
# bulk-pic-renamer.sh

# CHANGEABLE VALUES
prefix="IMG*"
log="rename.log"

pic_renamer () {
  local FILENAME="$1"
  local BASENAME=$(basename $FILENAME)
  local DIRNAME="$(dirname $(realpath $FILENAME))"
  local EXT="."$(echo $BASENAME | cut -d "." -f 2)
  local DATETIME=$(exiftool -DateTimeOriginal $FILENAME)

  if [[ -n $DATETIME ]]
  then
    local NEWNAME=$(echo $DATETIME | awk -F " " '{print $4,$5}' | tr ":" "-" | tr " " "_")$EXT

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
    mv $FILENAME "$DIRNAME/$NEWNAME"
  else
    echo "No datetime in $BASENAME."
    exit
  fi
}

echo "Prefix: $prefix"
echo "Log file: $log"
echo "Affected files:"
if ! ls $prefix
then
  echo "No files found with pre/suffix: $prefix, exiting."
  exit 1
fi

select yn in "Run" "Exit"; do
  case $yn in
    "Run" ) for file in $prefix; do pic_renamer $file; done | tee "$log"; break;;
    "Exit" ) exit;;
  esac
done


echo "Checking if $prefix files still exists..."
if ls $prefix 2>/dev/null
then
  echo "Move images to no-timestamp folder?"
  select yn in "Yes" "No"; do
    case $yn in
      "Yes" ) mkdir no-timestamp && mv $prefix no-timestamp/; break;;
      "No" ) exit;;
    esac
  done
fi
