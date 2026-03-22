#!/usr/bin/env bash
# Creates the standard project layout in the current tmux window
# Layout: Neovim (left 65%) | Dev server (top-right) / Claude Code (bottom-right)

SESSION=$(tmux display-message -p '#S')
WINDOW=$(tmux display-message -p '#I')
PATH_CURRENT=$(tmux display-message -p '#{pane_current_path}')

# Rename window to project folder name
tmux rename-window "$(basename $PATH_CURRENT)"

# Start with one pane, open neovim
tmux send-keys "nvim" Enter

# Split right for dev server + claude code
tmux split-window -h -c "$PATH_CURRENT" -p 20

# Split the right pane vertically
tmux split-window -v -c "$PATH_CURRENT"

# Top-right: label it (you'll run your dev server here)
tmux select-pane -T "dev-server"

# Bottom-right: claude code
tmux select-pane -U
tmux select-pane -T "claude-code"
tmux send-keys "claude" Enter

# Focus back on neovim (pane 1)
tmux select-pane -t 1
