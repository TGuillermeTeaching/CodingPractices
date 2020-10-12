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
FILE_NAME="${CHAPTER_NUMBER}_${CHAPTER_NAME}"

## Initiate the chapter
echo "---" > ${FILE_NAME}.Rmd
echo "title: ${CHAPTER_TITLE}" >> ${FILE_NAME}.Rmd
echo "author: Thomas Guillerme (guillert@tcd.ie)" >> ${FILE_NAME}.Rmd
echo "date: \`r Sys.Date()\`" >> ${FILE_NAME}.Rmd
echo "bibliography: [references.bib]" >> ${FILE_NAME}.Rmd
echo "output:" >> ${FILE_NAME}.Rmd
echo "  html_document: default" >> ${FILE_NAME}.Rmd
echo "  pdf_document: default" >> ${FILE_NAME}.Rmd
echo "---" >> ${FILE_NAME}.Rmd
echo "" >> ${FILE_NAME}.Rmd
echo "" >> ${FILE_NAME}.Rmd
echo "# ${CHAPTER_TITLE}" >> ${FILE_NAME}.Rmd
echo "A new chapter..." >> ${FILE_NAME}.Rmd

## Add the chapter folder
mkdir ${FILE_NAME}