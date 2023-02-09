#!/bin/sh

OUT=~/Pictures/screenshots/$(date "+%Y-%m-%d_%H.%M.%S.mp4")

wf-recorder -g "$(slurp)" -f $OUT
