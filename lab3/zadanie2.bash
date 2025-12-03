#!/bin/bash
D="$1"
P="$2"

find "$D" -type f -printf "%f %s\n" | head -8 | sort -rn -k2 | tee "$P"
