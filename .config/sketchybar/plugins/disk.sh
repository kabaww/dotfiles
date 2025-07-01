#!/bin/bash

# Get available disk space in Kilobytes (-k flag)
# Then use awk to convert the Kilobyte value to Gigabytes (base-10)
# by dividing by 1000*1000, and format it as a whole number (%.0f).
FREE_SPACE_GB=$(df -k / | awk 'NR==2 { printf "%.0f", $4 / 1000000 }')

# Set the SketchyBar item's label, appending "GB"
# Make sure your item is named "disk" or change it here.
sketchybar --set disk label="${FREE_SPACE_GB}GB"
