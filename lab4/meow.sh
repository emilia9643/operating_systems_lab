#!/bin/bash
P="$1"

awk -F'#' '
{
    split($1, time, "-")
    sek=time[1]
    min=time[2]
    hour=time[3]

    pn="am"
    if (hour >= 12) pn="pm"

    hour = hour % 12
    if (hour == 0) hour = 12

    $1 = hour ":" min " " pn

    print $0
}
' "$P"
