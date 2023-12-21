#!/bin/bash

ARCHIVE=/home/alanadev/Documentos/Shell/arquivos/texto.txt

echo "============== Script Busca Palavras =============="
echo

if [ $# -gt 0 ]
then
	echo "Resultado da pesquisa:"
	echo
	echo "$(grep "$1" $ARCHIVE)"
else
	echo "Informe a palavra por parâmetro"
fi

echo

echo "=================== Fim Script======================"

exit
