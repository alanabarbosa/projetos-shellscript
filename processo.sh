#!/bin/bash

read -p "Digite o nome de um processo: " PROCESSO

while true; do
	if pgrep "$PROCESSO" > /dev/null; then
		echo "$PROCESSO está em execução"
		sleep 2
		echo
	else		
		echo "ATENÇÃO!!! $PROCESSO não está em execução"
		sleep 2
		echo
	fi
	
done

