sketchybar --add item battery right                      \
           --set battery script="$PLUGIN_DIR/battery.sh" \
                         update_freq=10                  \
			 label.font="$FONT:Light:12.0" \
           --subscribe battery system
