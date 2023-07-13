#!/usr/bin/env bash

MONITOR='"Philips Consumer Electronics Company PHL 275E1 0x0000267B"'
ACTIVE_WORKSPACE=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true) | .name')

# Create workspaces if they don't exist yet
swaymsg workspace 1 output "$MONITOR"
swaymsg workspace 2 output "$MONITOR"
swaymsg workspace 3 output "$MONITOR"
swaymsg workspace 4 output "$MONITOR"
swaymsg workspace 5 output "$MONITOR"

swaymsg workspace 1, move workspace to output "$MONITOR"
swaymsg workspace 2, move workspace to output "$MONITOR"
swaymsg workspace 3, move workspace to output "$MONITOR"
swaymsg workspace 4, move workspace to output "$MONITOR"
swaymsg workspace 5, move workspace to output "$MONITOR"

swaymsg workspace "$ACTIVE_WORKSPACE"
