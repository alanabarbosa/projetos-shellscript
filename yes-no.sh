#!/bin/bash

read -p "Você gostou dessa pergunta? " reply_variable

if [[ ${reply_variable,,} = 'y' || ${reply_variable,,} = 'yes' ]]; then
	echo "Ótimo, trabalhei muito nisso!"
	exit 0
elif [[ ${reply_variable^^} = 'N'|| ${reply_variable^^} = 'NO' ]]; then
    	echo "Ah, sinto muito ouvir isso. Vou tentar melhorar na próxima vez."
   	exit 1
else
    	echo "Resposta inválida. Por favor, responda com 'y' ou 'n'."
    	exit 1
fi
