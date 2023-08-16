#!/bin/bash

POSTS=$(ls data/posts -1t | head -5)
IFS=$'\n' 

for FILE in $POSTS; do
    NAME="${FILE%.*}"

    # META=$(pandoc --standalone --template templates/meta.html "data/posts/${FILE}")
    # ARRAY=($META)

    TITLE=$(frontman -i "data/posts/${FILE}" -g title)
    DATE=$(frontman -i "data/posts/${FILE}" -g date)

    NEWDATE=$(date --date="${DATE}" "+%b %d, %Y")

    echo "<li><small class="date">${NEWDATE}</small> - <a href=\"/posts/${NAME}\">${TITLE}</a></li>"
done