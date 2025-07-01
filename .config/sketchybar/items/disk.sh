#!/usr/bin/env bash

disk=(
	label.font="$FONT:Bold:12.0"
	label.color="$WHITE"
	y_offset=-3
	update_freq=30
	script="$PLUGIN_DIR/disk.sh"
	background.padding_right=0
)

disklabel=(
	label="/dev/disk3"
	label.font="$FONT:Light:6.0"
	label.color="$WHITE"
	y_offset=6
	width=0
)

sketchybar --add item disklabel right --set disklabel "${disklabel[@]}"
sketchybar --add item disk right --set disk "${disk[@]}"

