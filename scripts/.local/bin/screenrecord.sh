#!/bin/sh

OUT=~/Pictures/screenshots/$(date "+%Y-%m-%d_%H.%M.%S.png")

wf-recorder -f $OUT
