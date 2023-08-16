#!/bin/bash

POSTS=$(ls data/posts -1t)
IFS=$'\n' 

for FILE in $POSTS; do
    NAME="${FILE%.*}"

    # META=$(pandoc --standalone --template templates/meta.html "data/posts/${FILE}")
    # ARRAY=($META)

    TITLE=$(frontman -i "data/posts/${FILE}" -g title)
    DATE=$(frontman -i "data/posts/${FILE}" -g date)
    DESC=$(frontman -i "data/posts/${FILE}" -g description)
    
    NEWDATE=$(date --date="${DATE}" "+%b %d, %Y")

    echo "<small class=\"date\">${NEWDATE}</small><br><a href=\"/posts/${NAME}\">${TITLE}</a><br><small style=\"margin-top: 4px\">${DESC}</small><br><br>"
done