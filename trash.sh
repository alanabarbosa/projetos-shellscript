#!/bin/bash

PACOTE="trash-cli"

# Verifica se o pacote está instalado
if ! dpkg -l | grep -q $PACOTE ; then
    echo "$PACOTE não está instalado"
    read -p "Deseja instalar o pacote (y/n)?: " RESPOSTA

    if [ ${RESPOSTA,,} = "y" ]; then
        sudo apt-get install $PACOTE
        echo
        echo "Instalado com sucesso"        
    elif [ ${RESPOSTA,,} = "n" ]; then
        echo "Encerrando o programa"
        exit 1
    else
    	echo "Resposta inválida"
    	exit 2
    fi
fi


while true
do

	echo
	echo "Escolha uma opção do Menu:"
	echo
	echo "1 - Listar Arquivos lixeira"
	echo "2 - Esvaziar lixeira"
	echo "q - sair"
	echo
	read -p "Digite a opção: " OPCAO
	echo
	
	TRASH_LIST=$(trash-list)


	case "$OPCAO" in
	   1)   
	     if [ -z "$TRASH_LIST" ]; then
		 echo "A lixeira está vazia. Não há nada para listar."
		 break
	     else
		 echo "listando items lixeira..."
		 echo
		 trash-list
		 echo "Items listados com sucesso."
	     fi
	     ;;
	   2)    
	     if [ -z "$TRASH_LIST" ]; then
		 echo "A lixeira está vazia. Não há nada para esvaziar."
		 break
	     else
		 echo "Esvaziando lixeira..."
		 echo
		 trash-empty
		 echo "Lixeira esvaziada com sucesso."
	     fi
	     ;;
	 q)
	   echo "Saindo..."
	   sleep 1
	   break
	   ;;
	 *)
	   echo "Opção Inválida"
	   ;;
	esac
done


