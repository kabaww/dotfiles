#!/bin/bash

# Get the current active workspace ID
current_workspace=$(hyprctl activeworkspace -j | jq -r '.id')

# Define your browser and its base command
BROWSER_CMD="zen-browser"

# Determine which browser instance to launch based on the workspace
case $current_workspace in
    1)
        # Default browser on workspace 1
        exec $BROWSER_CMD -P "kabaww-work" --name "work-browser"
        ;;
    3)
        # Work browser on workspace 3
        # For Firefox, you'd use --profile. For Chromium, it might be --profile-directory or --app-id
        # Also, use --new-instance to ensure a separate process for Firefox.
        exec $BROWSER_CMD -P "kabaww-dev" --name "dev-browser"
        ;;
    4)
        # Personal browser on workspace 5
        exec $BROWSER_CMD -P "kabaww-chill" --name "chill-browser"
        ;;
    *)
        # Fallback for other workspaces (e.g., launch default browser)
        exec $BROWSER_CMD -P "kabaww-chill" --name "chill-browser"
        ;;
esac
