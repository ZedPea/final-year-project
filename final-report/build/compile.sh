#!/bin/bash
FILES=../sections/*.tex

for f in $FILES
do
    aspell --home-dir=. --personal=dictionary.txt -t -c $f
done

cp -r ../logo.svg ../final-report.tex ../sections/ .

pdflatex --shell-escape -interaction=batchmode final-report.tex &&
biber final-report.bcf &&
pdflatex --shell-escape -interaction=batchmode final-report.tex
