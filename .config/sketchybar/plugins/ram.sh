#!/bin/bash

# This script calculates the truly available memory (Free + Inactive)
# and performs all calculations within a single awk process to avoid
# shell errors with floating point numbers from vm_stat.

# Pass the page size into awk as a variable.
PAGE_SIZE=$(pagesize)

# The awk command finds the relevant lines, adds the values,
# performs the calculation, and prints the formatted result.
AVAILABLE_GB=$(vm_stat | awk -v ps="$PAGE_SIZE" '
  /Pages free/ {free = $3}
  /Pages inactive/ {inactive = $3}
  /Pages speculative/ {speculative = $3}
  END {
    # Ensure page size is valid before dividing
    if (ps > 0) {
	    printf "%.1f", (((free + inactive + speculative) * ps)/1024/1024/1024)
    }
  }
')

# Set the SketchyBar label
sketchybar --set "$NAME" label="${AVAILABLE_GB}GB"
