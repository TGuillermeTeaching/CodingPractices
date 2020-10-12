#!/bin/sh

rm good_coding_practices.Rmd

## Remove files before hand
rm -R _book/
rm -R _bookdown_files/

## Compile the html
R -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")' # HTML version

## Compile the pdf
R -e 'bookdown::render_book("index.Rmd", "bookdown::pdf_book")' # PDF version

rm -R _bookdown_files/
