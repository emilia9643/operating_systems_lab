#!/bin/bash
D="$1"
K="$2"
find "$D" -type f -size -10c -exec mv {} "$K" \;
