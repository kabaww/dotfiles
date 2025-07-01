#!/usr/bin/env bash

network_down=(
	y_offset=-5
	label.font="$FONT:Light:10"
	label.color="$WHITE"
	label.width=55
	label.align="right"
	icon="􀄰"
	icon.font="$NERD_FONT:Bold:12.0"
	icon.color="$BLUE"
	icon.highlight_color="$RED"
	update_freq=1
	background.padding_left=0
	background.padding_right=6
	icon.padding_left=0
)

network_up=(
	background.padding_right=-73
	y_offset=5
	label.font="$FONT:Light:10"
	label.color="$WHITE"
	label.width=55
	label.align="right"
	icon="􀄯"
	icon.font="$NERD_FONT:Bold:12.0"
	icon.color="$BLUE"
	icon.highlight_color="$GREEN"
	update_freq=1
	script="$PLUGIN_DIR/network.sh"
)

sketchybar 	--add item network.down right 						\
						--set network.down "${network_down[@]}" 	\
						--add item network.up right 							\
						--set network.up "${network_up[@]}"
