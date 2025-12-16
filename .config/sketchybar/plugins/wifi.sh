#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

# Get WiFi information
CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null)"

if [ -z "$CURRENT_WIFI" ]; then
	# WiFi is off or not available
	sketchybar --set wifi.control icon=$WIFI_ICN \
	                                  icon.color=$GREY \
	           --set wifi.ssid label="WiFi Off" \
	                          icon=$NETWORK_ICN \
	                          icon.color=$GREY \
	           --set wifi.speed label="N/A" \
	                          icon=$SPEED_ICN \
	                          icon.color=$GREY \
	           --set wifi.signal label="N/A" \
	                           icon=$WIFI_ICN \
	                           icon.color=$GREY
	exit 0
fi

SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"
CURR_TX="$(echo "$CURRENT_WIFI" | grep -o "lastTxRate: .*" | sed 's/^lastTxRate: //')"
RSSI="$(echo "$CURRENT_WIFI" | grep -o "agrCtlRSSI: .*" | sed 's/^agrCtlRSSI: //')"
NOISE="$(echo "$CURRENT_WIFI" | grep -o "agrCtlNoise: .*" | sed 's/^agrCtlNoise: //')"

# Calculate signal quality (0-100)
# RSSI is typically negative (e.g., -50 dBm), better signal = less negative
if [ -n "$RSSI" ] && [ "$RSSI" != "" ]; then
	# Typical range: -30 (excellent) to -90 (poor)
	# Normalize to 0-100: -30 = 100%, -90 = 0%
	# Use awk for proper arithmetic with negative numbers
	SIGNAL_PERCENT=$(echo "$RSSI" | awk '{
		if ($1 >= -30) print 100
		else if ($1 <= -90) print 0
		else print int(($1 + 90) * 100 / 60)
	}')
else
	SIGNAL_PERCENT=0
fi

# Determine signal strength color based on percentage
if [ "$SIGNAL_PERCENT" -ge 70 ]; then
	SIGNAL_COLOR=$GREEN
elif [ "$SIGNAL_PERCENT" -ge 40 ]; then
	SIGNAL_COLOR=$YELLOW
else
	SIGNAL_COLOR=$RED
fi

# Format speed
if [ -n "$CURR_TX" ] && [ "$CURR_TX" != "" ] && [ "$CURR_TX" != "0" ]; then
	# Convert to integer for comparison
	CURR_TX_INT=$(echo "$CURR_TX" | awk '{print int($1)}')
	if [ "$CURR_TX_INT" -ge 1000 ]; then
		SPEED_FORMAT="$(echo "$CURR_TX" | awk '{printf "%.1fGbps", $1/1000}')"
	else
		SPEED_FORMAT="${CURR_TX}Mbps"
	fi
else
	SPEED_FORMAT="N/A"
fi

# Format signal strength
if [ -n "$RSSI" ]; then
	SIGNAL_FORMAT="${SIGNAL_PERCENT}% (${RSSI} dBm)"
else
	SIGNAL_FORMAT="N/A"
fi

# Update main control item
sketchybar --set wifi.control icon=$WIFI_ICN \
	                          icon.color=$SIGNAL_COLOR

# Update popup items
if [ -n "$SSID" ] && [ "$SSID" != "" ]; then
	sketchybar --set wifi.ssid label="$SSID" \
	                          icon=$NETWORK_ICN \
	                          icon.color=$ACCENT_COLOR
	
	sketchybar --set wifi.speed label="$SPEED_FORMAT" \
	                          icon=$SPEED_ICN \
	                          icon.color=$ACCENT_COLOR
	
	sketchybar --set wifi.signal label="$SIGNAL_FORMAT" \
	                           icon=$WIFI_ICN \
	                           icon.color=$SIGNAL_COLOR
else
	sketchybar --set wifi.ssid label="Not Connected" \
	                          icon=$NETWORK_ICN \
	                          icon.color=$GREY
	
	sketchybar --set wifi.speed label="N/A" \
	                          icon=$SPEED_ICN \
	                          icon.color=$GREY
	
	sketchybar --set wifi.signal label="N/A" \
	                           icon=$WIFI_ICN \
	                           icon.color=$GREY
fi
