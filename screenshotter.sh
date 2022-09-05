#!/bin/sh

FILE_BASEPATH=~/Pictures/
FILE_NAME=`date +%Y%m%d-%H%M%S-screenshot.jpg`

if [[ $# -ne 1 ]]; then
  echo "Usage:"
  echo "$0 area     to take a screenshot of an area defined with the mouse"
  echo "$0 window   to take a screenshot of a single application by clicking on it"
  exit 1
fi

if [[ $1 == "area" ]]; then
  import $FILE_BASEPATH$FILE_NAME
elif [[ $1 == "window" ]]; then
  # jq parses the json window tree and finds the id of the win in focus
  import -window $( \
    i3-msg -t get_tree | \
    jq 'recurse(.nodes[]) | select(.focused).window' \
  ) $FILE_BASEPATH$FILE_NAME
fi

xclip -selection clipboard -target image/png -i < $FILE_BASEPATH$FILE_NAME
