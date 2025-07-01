#!/bin/bash

# You can customize the date format however you like.
# See "man date" for format options.
#
# E.g., for 24-hour time with seconds:
# FORMAT='+%a %b %d  %H:%M:%S'
#
# For just 12-hour time without date:
# FORMAT='+%I:%M %p'

# Format: Day Month Date  Hour:Minute AM/PM
# e.g., Mon Jun 30  09:40 PM
FORMAT='+%a %b %d  %I:%M %p'
DATETIME=$(date "${FORMAT}")

sketchybar --set clock label="$DATETIME"
