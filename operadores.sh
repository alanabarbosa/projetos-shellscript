#!/bin/bash

#Operadores Aritméticos
var=58
var2=20

echo "Adição $((  ${var} + ${var2} ))"
echo "Subtração $(( ${var} - ${var2} ))"
echo "Multiplicação $(( ${var} * ${var2} ))"
echo "Divisão $(( ${var} / ${var2} ))"
echo "Módulo $(( ${var} % ${var2} ))"
echo "Diferença $(( ${var} != ${var2} ))"

#Operadores booleanos
verdadeiro=true
falso=false

# Testando expressões booleanas
if [ "$verdadeiro" == true ] || [ "$falso" == true ]; then
    echo "A expressão usando '-o' é verdadeira."
else
    echo "A expressão usando '-o' não é verdadeira."
fi

if [ "$verdadeiro" == true ] && [ "$falso" == true ]; then
    echo "A expressão usando '-a' é verdadeira."
else
    echo "A expressão usando '-a' não é verdadeira."
fi
