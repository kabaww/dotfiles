#!/bin/bash

# Power menu options
options="Lock Screen\nLogout\nReboot\nShutdown"

# Use rofi to display the menu
# -dmenu: Enable dmenu mode (text input)
# -p: Set a prompt text
# -matching fuzzy: Use fuzzy matching for options
# -lines 3: Display 3 lines (matching our options)
# -width 10: Set a fixed width (adjust as needed, Rofi handles this differently than wofi)
chosen=$(echo -e "$options" | rofi -dmenu -p "Power actions" -matching fuzzy -lines 3)

case "$chosen" in
    "Lock Screen")
	hyprlock || hyprctl dispatch exit
	;;
    Logout)
        hyprctl dispatch exit
        ;;
    Reboot)
        systemctl reboot
        ;;
    Shutdown)
        systemctl poweroff
        ;;
esac
