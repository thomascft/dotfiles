#!/bin/sh

OUT=~/Pictures/screenshots/$(date "+%Y-%m-%d_%H.%M.%S.png")

wayshot -f $OUT
