#!/bin/bash

# Get a list of all workspaces that currently have windows
# AeroSpace command 'list-workspaces --empty no' is perfect for this
OCCUPIED_WORKSPACES=$(aerospace list-workspaces --empty no)
FOCUSED=$FOCUSED_WORKSPACE

# Iterate through workspaces 6 to 10 (adjust max as needed)
for i in {6..10}; do
    # Check if workspace 'i' is occupied or currently focused
    if echo "$OCCUPIED_WORKSPACES" | grep -q "^$i$" || [ "$i" = "$FOCUSED" ]; then
        # If it doesn't exist on the bar yet, create it
        if ! sketchybar --query workspace."$i" > /dev/null 2>&1; then
            # Add the workspace AFTER the previous one
            PREV_WS=$((i - 1))
            sketchybar --add item workspace."$i" left --after workspace."$PREV_WS"
            
            # FORCE the window_title to move to the end of the left section
            sketchybar --reorder workspace.1 workspace.2 workspace.3 workspace.4 workspace.5 \
                       workspace.6 workspace.7 workspace.8 workspace.9 workspace.10 \
                       window_title

        fi
            sketchybar --set aerospace."$i" \
                       drawing=on \
                       label="$i" \
                       click_script="aerospace workspace $i" \
                       background.drawing=$([ "$i" = "$FOCUSED" ] && echo "on" || echo "off")
    else
        # If it's empty and not focused, hide it (or remove it)
        sketchybar --set aerospace."$i" drawing=off
    fi
done

# Also update the styling for the permanent 1-5 workspaces
for i in {1..5}; do
    sketchybar --set aerospace."$i" \
               background.drawing=$([ "$i" = "$FOCUSED" ] && echo "on" || echo "off")
done
