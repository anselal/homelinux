#!/bin/bash
ICON=$HOME/.config/i3/scripts/lock_icon.png
TMPBG=/tmp/screen.png
scrot $TMPBG
convert $TMPBG -scale 10% -scale 1000% $TMPBG
# Merge custom lock icon with pixeled background image
# convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
i3lock -e -f -i $TMPBG # -u
