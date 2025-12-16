#!/usr/bin/env sh

if [ "$SENDER" = "aerospace_workspace_change" ]; then
    if [ "$NAME" = "aerospace.$FOCUSED_WORKSPACE" ]; then
        sketchybar --set "$NAME" background.drawing=on
    else
        sketchybar --set "$NAME" background.drawing=off
    fi
fi
