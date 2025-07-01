#!/usr/bin/env bash

memory=(
	label.font="$FONT:Bold:12.0"
	label.color="$WHITE"
	y_offset=-3
	update_freq=15
	script="$PLUGIN_DIR/ram.sh"
)

memorylabel=(
	label="FREE"
	label.font="$FONT:Light:6.0"
	label.color="$WHITE"
	y_offset=6
	width=0
)

sketchybar --add item memorylabel right --set memorylabel "${memorylabel[@]}"
sketchybar --add item memory right --set memory "${memory[@]}"

