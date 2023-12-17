#!/bin/bash

echo "O número de sub-diretório atual é:"
find . -type d | wc -l

echo "O so do diretório, classificado em ordem descrescente, é o seguinte:"
find . -type s | du | sort -nr

echo "O número de arquivos no diretório atual é:"
find . -type f | wc -l

echo "O uso do arquivo, classificado em ordem decrescente, é o seguinte:"
find . -type f -exec ls -al {} \; | sort -k 5 -nr | sed 's/ \+/\t/g' | cut -f5,9
