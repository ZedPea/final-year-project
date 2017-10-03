#!/bin/bash
FILES=../pages/*.tex

for f in $FILES
do
    aspell --home-dir=. --personal=dictionary.txt -t -c $f
done

cp -r ../logo.svg ../initial-report.tex ../pages/ .

pdflatex --shell-escape -interaction=batchmode initial-report.tex &&
bibtex initial-report.aux &&
pdflatex --shell-escape -interaction=batchmode initial-report.tex &&
pdflatex --shell-escape -interaction=batchmode initial-report.tex
