#!/bin/bash

K1=$(realpath "$1")
K2=$(realpath "$2")

K1="${K1#/}"
K2="${K2#/}"

counter=1
relativepath=""

IFS="/"
for p in $K1; do
    part=$(echo "$K2" | awk -F"/" -v n="$counter" '{print $n}')
    if [ "$p" = "$part" ]; then
        relativepath="${relativepath}/$p"
        ((counter++))
    else
        break
    fi
done

echo "Wspolny prefiks: $relativepath"
