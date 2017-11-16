#!/bin/bash
FILES=../sections/*.tex

for f in $FILES
do
    aspell --home-dir=. --personal=dictionary.txt -t -c $f
done

cp -r ../logo.svg ../interim-report.tex ../sections/ .

pdflatex --shell-escape -interaction=batchmode interim-report.tex &&
biber interim-report.bcf &&
pdflatex --shell-escape -interaction=batchmode interim-report.tex
