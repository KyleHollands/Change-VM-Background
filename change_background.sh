#!/bin/bash

# Acquire color input from the user.
read -p "Enter crayon color: " COLOR

# Create the QUERY variable that holds the SQL query utilizing the previously entered COLOR variable.
QUERY="SELECT hex FROM wax.crayons WHERE color = ('$COLOR')"

# Creat the HEX variable starting the impala shell with parameters, then running the prior QUERY variable.
HEX=$(impala-shell --delimited --quiet -q "$QUERY")

# To ensure solid colors work, reset the background options to none.
gconftool-2 -t str -s /desktop/gnome/background/picture_options none

# Change the background color indicated by the HEX environment variable.
gconftool-2 -t str -s /desktop/gnome/background/primary_color "#$HEX"