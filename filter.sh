#!/bin/bash

read -p "Digite o diretório para onde copiar o arquivo: " DESTDIR
echo -e "\n"

if [ "$DESTDIR" == "" ];
then
    echo "Você deve especificar um diretório."
else
    if [ ! -d "$DESTDIR" ]
    then
	echo "Diretório $DESTDIR deve existir. Saindo!"
	exit
    fi
fi

echo "Digite os critérios de denotação de número para pesquisa: "
echo "1 = por nome "
echo "2 = por dono "
echo "3 = por extensão "
echo -e "\n"
read CRIT

case $CRIT in

	1)
		read -p "Digite o nome para pesquisar: " NAME
		echo -e "\n"
		if [ ! -z $NAME="" ]
				then
						find / -name "$NAME" -exec cp {} $DESTDIR \; 2> /dev/null
						else
							echo "Você tem que digitar o nome!"
fi
;;

	2)
		read -p "Insira o proprietário para pesquisar: " OWNER
		echo -e "\n"
		if [ ! -z $OWNER="" ]
			then
				find / -user $OWNER -exec cp {} $DESTDIR \; 2> /dev/null
			else
				echo "Você tem que inserir um proprietário!"
		fi
		;;

   3)
   		read -p "Insira a extensão de conteúdo: " CEXT
   		echo -e "\n"
   		if [ ! -z $CEXT="" ]
   		     then
   		     		read -p "Onde estamos procurando arquivos, em qual diretório?" LOOKUP
   		     		find "$LOOKUP" -type f -name "$CEXT" -exec cp {} $DESTDIR \; 2> /dev/null

		     else
		     		echo "Você tem que inserir o tipo de conteúdo!"
		fi
		;;
		      *)  echo "Por favor, faça uma escolha, 1, 2 ou 3!"

		 esac
