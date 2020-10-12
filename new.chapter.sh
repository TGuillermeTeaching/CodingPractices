#!/bin/sh

##########################
#Shell script for initiating making a new chapter.
##########################
#SYNTAX: sh chapter.name.sh -name <name> -number <number>
#with:
#-name <name> the name of the chapter
#-number <number> the number of the chapter (optional)
#    If the number is missing, makes the chapter _<name>
##########################
#----
#guillert(at)tcd.ie - 2020/10/12
##########################

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -name)
        CHAPTER_NAME="$2"
        shift
        ;;
    -number)
        CHAPTER_NUMBER="$2"
        ;;
        *)
        ;;
esac
shift
done

## Set up the variables
CHAPTER_TITLE=$(echo ${CHAPTER_NAME} | sed 's/_/ /g')
FILE_NAME="${CHAPTER_NUMBER}_${CHAPTER_NAME}.Rmd"

## Initiate the chapter
echo "---" > ${FILE_NAME}
echo "title: ${CHAPTER_TITLE}" >> ${FILE_NAME}
echo "Thomas Guillerme (guillert@tcd.ie)" >> ${FILE_NAME}
echo "\`r Sys.Date()\`" >> ${FILE_NAME}
echo "bibliography: [References.bib]" >> ${FILE_NAME}
echo "output:" >> ${FILE_NAME}
echo "  html_document: default" >> ${FILE_NAME}
echo "  pdf_document: default" >> ${FILE_NAME}
echo "---" >> ${FILE_NAME}
echo "" >> ${FILE_NAME}
echo "" >> ${FILE_NAME}
echo "# ${CHAPTER_TITLE}" >> ${FILE_NAME}
echo "A new chapter..." >> ${FILE_NAME}
