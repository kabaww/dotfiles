#!/bin/bash

# Function to get player status and metadata
get_media_info() {
    local field="$1"
    player_status=$(playerctl status)
    if [ "$player_status" = "Playing" ]; then
        artist=$(playerctl metadata artist)
        title=$(playerctl metadata title)

        # Truncate long titles/artists if desired
        max_len=30
        if [ ${#title} -gt $max_len ]; then
            title="${title:0:$max_len}..."
        fi
        if [ ${#artist} -gt $max_len ]; then
            artist="${artist:0:$max_len}..."
        fi

        # Output JSON based on the requested field
        case "$field" in
            "title")
                echo "{\"text\":\"$title\", \"class\":\"title\"}"
                ;;
            "artist")
                echo "{\"text\":\"$artist\", \"class\":\"artist\"}"
                ;;
            *)
                # Default to empty if no specific field requested or invalid
                echo "{\"text\":\"\", \"class\":\"\"}"
                ;;
        esac
    elif [ "$player_status" = "Paused" ]; then
        artist=$(playerctl metadata artist)
        title=$(playerctl metadata title)
	case "$field" in
            "title")
                echo "{\"text\":\"PAUSED\", \"class\":\"title\"}"
                ;;
            "artist")
                echo "{\"text\":\"$title\", \"class\":\"artist\"}"
                ;;
            *)
                # Default to empty if no specific field requested or invalid
                echo "{\"text\":\"\", \"class\":\"\"}"
                ;;
        esac

    else
        # Output empty text if no media is playing, so the module disappears
        case "$field" in
            "title")
                echo "{\"text\":\"\", \"class\":\"title\"}"
                ;;
            "artist")
                echo "{\"text\":\"\", \"class\":\"artist\"}"
                ;;
            *)
                # Default to empty if no specific field requested or invalid
                echo "{\"text\":\"\", \"class\":\"\"}"
                ;;
        esac
    fi
}

# Execute media info retrieval with the first argument
get_media_info "$1"
