#!/usr/bin/env bash
set -eo pipefail
IFS=$'\n'
function getExtension {
  local file =$(basename -- "$1");
  echo "${1##*.}";
}

function convertImages {
  cd "$1";
  for file in $(ls *.{jpg,jpeg,png})
  do
    local size=$(identify "$file" | awk '{print $3}' | awk -F x '{print $2}');
    if [ "$size" -ge 2400 ]; then
      echo "[process]: $file";
      convert "$file" -resize 50% "$file";
    fi

    if [ "$size" -ge 2000 ] && [ "$size" -lt 2400 ]; then
      echo "[process]: $file";
      convert "$file" -resize 70% "$file";
    fi
  done;
  cd -
}

function main {
  for zip in $(ls *.{zip,rar})
  do
    local name=$(basename -- "$zip");
    local ext="${name##*.}";
    local dir="${name%.*}";

    if [[ "$ext" = "zip" ]]; then
      unzip "$zip" -d "$dir";
    fi;

    if [[ "$ext" = "rar" ]]; then
      unrar e "$zip" "$(pwd)/$dir/";
    fi;

    convertImages "$dir";
    zip -r "$dir-2.zip" "$dir"
    rm -r "$dir";
  done;
}

main;
IFS='
'