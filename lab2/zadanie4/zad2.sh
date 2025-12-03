#!/bin/bash
K1="$1"
K2="$2"
K1=$(realpath "$K1")
K2=$(realpath "$K2")
for dir in "$K1"/*; do
if [ -d "$dir" ]; then
  if [ "$dir" = "$K2" ]; then
    continue
  fi
base=$(basename "$dir")     
mv "$dir" "$K2"
ln -s "$K2/$base" "$K1/$base"
fi;
done;
