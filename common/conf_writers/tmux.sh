#!/bin/bash

cat > ~/.tmux.conf << EOF
set-window-option -g mode-keys vi
set-window-option -g allow-rename off
EOF
