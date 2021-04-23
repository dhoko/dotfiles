#!/usr/bin/env bash
set -eo pipefail

IFS=$'\n'
IS_DEBUG=false;



function getExtension {
  local file=$(basename -- "$1");
  local ext="${1##*.}";
  if [[ "$ext" == "png" ]]; then
       echo "$ext";
  fi;
  echo "JPEG";
}

function convertImages {

  cd "$1";
  ls -lh;
  
  for file in $(find * -type f -name "*.jpg" -or -name "*.jpeg" -or -name ".png"); do
  #for file in **/*.{jpg,jpeg,png}; do
  #for file in $(ls *.{jpg,jpeg,png});  do

    local ext=$(getExtension "$file" | tr '[:lower:]' '[:upper:]');
    local size=$(identify "$file" | awk '{print $3}' | awk -F x '{print $2}');


    if [ "$IS_DEBUG" = true ]; then
        echo "[File] $file";
        echo "[Size] $size";
        echo "[Ext] $ext";
    fi;

    # if [ "$size" -ge 2400 ]; then
    #   echo "[process]: $file";
    #   convert "$file" -resize 50% "$file";
    # fi
    if [ "$size" -ge 1400 ]; then
      echo "[process]: $file";
      convert -resize x1400 "$file" "$file"

      if [ "$ext" = 'PNG' ]; then
        pngquant --quality=70-80 "$file"
      fi
    fi

    # if [ "$size" -ge 2000 ] && [ "$size" -lt 2400 ]; then
    #   echo "[process]: $file";
    #   convert "$file" -resize 70% "$file";
    # fi
  done;
  cd -
}

function main {
  for zip in $(ls *.{zip,rar}); do
    local name=$(basename -- "$zip");
    local ext="${name##*.}";
    local dir="${name%.*}";

    if [[ "$ext" = "zip" ]]; then
      unzip -qq "$zip" -d "$dir";
    fi;

    if [[ "$ext" = "rar" ]]; then
      unrar e "$zip" "$(pwd)/$dir/";
    fi;

    convertImages "$dir";
    zip -qq -r "$dir-2.zip" "$dir"
    rm -r "$dir";
  done;
}

if [[ "$1" == "resize" ]]; then
    convertImages "$2" "--debug"
    exit;
fi;


if [[ "$*" =~ "--debug" ]]; then
  IS_DEBUG=true;
fi;


main;
IFS='
'
