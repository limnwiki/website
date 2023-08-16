FILE="$1"
DEST="$2"

if [ $(echo ${FILE} | grep "data/posts") ]; then
    # pandoc --standalone --template ./templates/post.html ${FILE} -o ${DEST}
    BODY=$(frontman -i ${FILE} -v | cmark)
    frontman -t ${FILE} title ./templates/post.html "\$title\$" ${DEST}
    frontman -t ${FILE} title ${DEST} "\$title\$" ${DEST}
    frontman -t ${FILE} date ${DEST} "\$date\$" ${DEST}
    frontman -t ${FILE} description ${DEST} "\$description\$" ${DEST}
    frontman -t ${FILE} description ${DEST} "\$description\$" ${DEST}
    frontman -r "${BODY}" ${DEST} "\$body\$" ${DEST}

    DATE=$(frontman -i ${FILE} -g date)
    NEWDATE=$(date --date="${DATE}" "+%a, %d %b %Y 12:00:00")

    frontman -r "${NEWDATE}" ${DEST} "\$date-meta\$" ${DEST}
else
    # pandoc --standalone --template ./templates/template.html ${FILE} -o ${DEST}
    BODY=$(frontman -i ${FILE} -v | cmark)
    frontman -t ${FILE} title ./templates/template.html "\$title\$" ${DEST}
    frontman -t ${FILE} title ${DEST} "\$title\$" ${DEST}
    frontman -t ${FILE} description ${DEST} "\$description\$" ${DEST}
    frontman -r "${BODY}" ${DEST} "\$body\$" ${DEST}
fi