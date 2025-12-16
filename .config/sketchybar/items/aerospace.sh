SPACE_ICONS=("1" "2" "3" "4" "5")
SPACE_LABELS=("work" "code" "edit" "chill" "comms")

sketchybar --add event aerospace_workspace_change

for i in "${!SPACE_ICONS[@]}"
do
    sid=$(($i+1))
    echo "adding space $sid"
    sketchybar --add item aerospace.$sid left     \
        --set aerospace.$sid    \
                         icon=${SPACE_ICONS[i]}                     \
                         icon.padding_left=5                        \
                         icon.padding_right=2                       \
                         background.padding_left=5                  \
                         background.padding_right=5                 \
                         background.corner_radius=5                 \
                         background.color=$ITEM_BG_COLOR            \
                         background.height=22                       \
                         background.drawing=off                     \
                         label=${SPACE_LABELS[i]}                   \
                         label.drawing=on                           \
                         label.font="$FONT:Light:12.0"              \
                         script="$PLUGIN_DIR/aerospace.sh"          \
                         click_script="aerospace workspace $sid" \
                         icon.color=$ACCENT_COLOR                   \
                         icon.font="$FONT:Bold:15.0" \
        --subscribe aerospace.$sid aerospace_workspace_change
done

sketchybar --add item workspace_display left \
           --subscribe workspace_display aerospace_workspace_change \
           --set workspace_display \
                 icon=󱂬 \
                 icon.padding_left=5                        \
                 icon.padding_right=2                       \
                 background.padding_left=5                  \
                 background.padding_right=5                 \
                 background.corner_radius=5                 \
                 background.color=$ITEM_BG_COLOR            \
                 background.height=22                       \
                 background.drawing=off                     \
                 label=${SPACE_LABELS[i]}                   \
                 label.drawing=on                           \
                 label.font="$FONT:Light:12.0"              \
                 click_script="aerospace workspace $sid" \
                 icon.color=$ACCENT_COLOR                   \
                 icon.font="$FONT:Bold:15.0" \
                 script="$PLUGIN_DIR/aerospace_workspace_display.sh"

# sketchybar --add item aerospace.others left \
#            --subscribe aerospace.others aerospace_workspace_change \
#            --set aerospace.others \
#                 script="$PLUGIN_DIR/aerospace_others.sh"
