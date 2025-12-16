#!/usr/bin/env sh

POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle && $PLUGIN_DIR/wifi.sh"

wifi_control=(
	icon=$WIFI_ICN
	icon.font="$NERD_FONT:Bold:14.0"
	icon.color="$ACCENT_COLOR"
	label.drawing=off
	click_script="$POPUP_CLICK_SCRIPT"
	popup.background.color=0x70000000
	popup.blur_radius=50
	popup.background.corner_radius=5
	popup.align=right
	popup.y_offset=5
	update_freq=5
	script="$PLUGIN_DIR/wifi.sh"
)

wifi_ssid=(
	icon=$NETWORK_ICN
	icon.font="$NERD_FONT:Bold:12.0"
	icon.color="$ACCENT_COLOR"
	label="Loading..."
	label.drawing=on
	label.font="$FONT:Medium:11.0"
	label.color="$WHITE"
	label.width=120
	label.align=left
	background.padding_left=8
	background.padding_right=8
	background.padding_top=4
	background.padding_bottom=4
)

wifi_speed=(
	icon=$SPEED_ICN
	icon.font="$NERD_FONT:Bold:12.0"
	icon.color="$ACCENT_COLOR"
	label="Loading..."
	label.drawing=on
	label.font="$FONT:Medium:11.0"
	label.color="$WHITE"
	label.width=120
	label.align=left
	background.padding_left=8
	background.padding_right=8
	background.padding_top=4
	background.padding_bottom=4
)

wifi_signal=(
	icon=$WIFI_ICN
	icon.font="$NERD_FONT:Bold:12.0"
	icon.color="$ACCENT_COLOR"
	label="Loading..."
	label.drawing=on
	label.font="$FONT:Medium:11.0"
	label.color="$WHITE"
	label.width=120
	label.align=left
	background.padding_left=8
	background.padding_right=8
	background.padding_top=4
	background.padding_bottom=4
)

sketchybar --add item           wifi.control right                      \
           --set wifi.control   "${wifi_control[@]}"                    \
                                                                        \
           --add item           wifi.ssid popup.wifi.control            \
           --set wifi.ssid      "${wifi_ssid[@]}"                       \
                                                                        \
           --add item           wifi.speed popup.wifi.control           \
           --set wifi.speed     "${wifi_speed[@]}"                      \
                                                                        \
           --add item           wifi.signal popup.wifi.control          \
           --set wifi.signal    "${wifi_signal[@]}"

# Trigger initial update
"$PLUGIN_DIR/wifi.sh"
