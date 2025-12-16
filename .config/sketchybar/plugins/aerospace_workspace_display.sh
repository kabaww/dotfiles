#!/bin/bash

CURRENT_WS=$(aerospace list-workspaces --focused)

WS_NUM=$(echo "$CURRENT_WS" | grep -oE '^[0-9]+')

# 3. Handle the logic
if [ "$WS_NUM" -gt 5 ]; then
    # We must set drawing=on first to "re-animate" the item
    sketchybar --set "$NAME" \
                             label="$CURRENT_WS" \
                             icon.drawing=on \
                             label.drawing=on \
                             background.drawing=on
else
    # Hide it when 5 or below
    sketchybar --set "$NAME" \
                    icon.drawing=off \
                    label.drawing=off \
                    background.drawing=off 
fi
