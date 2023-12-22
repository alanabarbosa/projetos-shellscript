#!/bin/bash

DIRETORIO=$HOME
DIRETORIOBACKUP=$HOME/Backup
BACKUP="backup_home_$(date +%Y%m%d%H%M).tgz"
DAYS7=$(find $DIRETORIOBACKUP -ctime -7 -name backup_home\*tgz)


if [ ! -d $DIRETORIOBACKUP ]; then
	echo "Criando o diretório $DIRETORIOBACKUP..."
	mkdir -p "$DIRETORIOBACKUP"
fi

if [ "$DAYS7" ]; then
	echo "Já foi gerado um backup do diretório $HOME nos últimos 7 dias."
	echo
	read -p "Deseja continuar? (y/n): " resposta
	echo
	if [ ${resposta,,} = 'y' ]; then
		echo "Será criado mais um backup para a mesma semana."
	elif [ ${resposta,,} = 'n' ]; then  # Adição do espaço após 'n' e antes do colchete fechado
		echo "Backup abortado!"
		exit 1
	else
		echo "Resposta inválida"
		exit 2
	fi  # Adição do 'fi' para fechar a estrutura condicional corretamente
fi


echo "Criando backup..."
tar zcvpf $DIRETORIOBACKUP/$BACKUP --absolute-names --exclude="$DIRETORIOBACKUP" "$HOME"/* > /dev/null

echo
echo "O backup de nome \""$BACKUP"\" foi criado em $DIRETORIOBACKUP"
echo
echo "Backup Concluído!"

