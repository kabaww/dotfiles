#!/usr/bin/env sh

sketchybar --add item space_separator left                            \
	   --add item window_title left                               \
	   --set window_title    script="$PLUGIN_DIR/window_title.sh" \
	   			 icon="./" 			      \
				 icon.font="$NERD_FONT:SemiBold:12.0"      \
				 icon.padding_right=0 		      \
	                         icon.drawing=on                      \
				 label.font="$NERD_FONT:Semibold:15.0"     \
	   --subscribe window_title front_app_switched
