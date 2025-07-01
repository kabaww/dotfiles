SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
SPACE_LABELS=("work" "code" "edit" "chill" "comms")

for i in "${!SPACE_ICONS[@]}"
do
    sid=$(($i+1))
    sketchybar --add space space.$sid left     \
        --set space.$sid associated_space=$sid     \
                         icon=${SPACE_ICONS[i]}                     \
                         icon.padding_left=5                        \
                         icon.padding_right=2                       \
                         background.padding_left=5                  \
                         background.padding_right=5                 \
                         background.corner_radius=5                 \
			 background.color=$ITEM_BG_COLOR	    \
                         background.height=22                       \
                         background.drawing=off                     \
			 label=${SPACE_LABELS[i]}		    \
                         label.drawing=on                           \
			 label.font="$FONT:Light:12.0" 		    \
                         script="$PLUGIN_DIR/space.sh"              \
                         click_script="yabai -m space --focus $sid" \
			 icon.color=$ACCENT_COLOR 		    \
                         icon.font="$FONT:Bold:15.0"
done
