#!/usr/bin/env bash

# Detect if lid is closed
LID_STATE=$(grep -o open /proc/acpi/button/lid/*/state 2>/dev/null)

if [ "$LID_STATE" != "open" ]; then
    # Lid closed = disable laptop screen
    swaymsg output eDP-1 disable
else
    # Lid open = enable laptop screen (optional: set mode)
    swaymsg output eDP-1 enable
fi
