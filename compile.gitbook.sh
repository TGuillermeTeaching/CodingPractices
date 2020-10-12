#!/bin/sh

## Shell script for compiling the gitbook

## Remove files before hand
rm good_coding_practices.Rmd
rm -R _book/
rm -R _bookdown_files/

## Compile the html
R -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")' # HTML version

## Compile the pdf
R -e 'bookdown::render_book("index.Rmd", "bookdown::pdf_book")' # PDF version

## Clean extra
rm -R _bookdown_files/
