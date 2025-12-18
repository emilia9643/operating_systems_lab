#!/bin/bash
P="$1"

awk '
{
    line = $0
    i = index(line, "#")
    inptime = substr(line, 1, i-1)
    text = substr(line, i)
    if (inptime ~ /^[0-9]+-[0-9]+-[0-9]+$/) {
        split(inptime, time, "-")
        sek = time[1]
        min = time[2]
        godz = time[3]
        if (sek >= 0 && sek < 60 && min >= 0 && min < 60 && godz >= 0 && godz < 24) {
            pn = "am"
            if (godz >= 12) pn = "pm"

            h = godz % 12
            if (h == 0) h = 12
            formatowane = sprintf("%d:%d %s", h, min, pn)
            print formatowane text
        } else {
            print "nieprawdziwe zakresy" inptime
        }
    } else  {}
}
' "$P"
