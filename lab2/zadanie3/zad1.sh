#!/bin/bash
K1="$1"
K2="$2"
K1=$(realpath "$K1")
K2=$(realpath "$K2")
for file in "$K2"/*; do
if [ -f "$file" ]; then
ln -s "$file" "$K1"
fi;
done;

