#!/bin/sh

OUT=~/Pictures/screenshots/$(date "+%Y-%m-%d_%H.%M.%S.png")

wayshot -s "$(slurp -f '%x %y %w %h')" -f $OUT
