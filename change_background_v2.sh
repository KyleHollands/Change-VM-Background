#!/bin/bash

read -p "Enter the name of a crayon color: " COLOR

HEX=$(impala-shell --quiet --delimited --var=color="$COLOR" -f get_color_hex.sql)

gconftool-2 -t str -s /desktop/gnome/background/primary_color "#$HEX"