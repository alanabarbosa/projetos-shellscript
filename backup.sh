#!/bin/bash

DATA=$(date +%y%m%d)

FILE=archive$DATE.tar.gz

CONFIG_FILE=/archive/Files_To_Backup
DESTINATION=/archive/$FILE

if [ -f $CONFIG_FILE ]
then
    echo
else
    echo
    echo "$CONFIG_FILE não existe."
    echo "Backup não concluído devido à falta do arquivo de configuraçao"
    echo
    exit
fi

FILE_NO=1
exec < $CONFIG_FILE
read FILE_NAME

while [ $? -eq 0 ]
do
if [ -f $FILE_NAME -o -d $FILE_NAME ]
   then
	FILE_LIST="$FILE_LIST $FILE_NAME"
   else
	echo
	echo "$ FILE_NAME, não exsite."
	echo "Obviamente, nõa o incluirei neste arquivo."
	echo "Está listado na linha $ FILE_NO do arquivo de configuração."
	echo "Continuando a construir lista de arquivos..."
	echo
fi

FILE_NO=$[$FILE_NO + 1]
read FILE_NAME

done

echo "Arquivo inicial..."
echo


tar -czf $DESTINATION $FILE_LIST 2> /dev/null

echo "Backup finalizado"
echo "O arquivo resultante é: $DESTINATION"
echo

exit


