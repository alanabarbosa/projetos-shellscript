#!/bin/bash

read -p "Digite o nome do usuário: " USUARIO

ls /home/$USUARIO > /dev/null 2>&1 || { echo "Usuario Inexistente" ; exit 1; }

USERID=$(grep $USUARIO /etc/passwd|cut -d":" -f3)
DESC=$(grep $USUARIO /etc/passwd|cut -d":" -f5 | tr -d ,)
USOHOME=$(du -sh /home/$USUARIO|cut -f1)

clear

echo "===================================================================================="
echo "Relatório do Usuário: $USUARIO"
echo
echo "UID: $USERID"
echo "Nome ou Descrição: $DESC"
echo
echo "Total Usado no /home/$USUARIO: $USOHOME"
echo
echo "Último login:"
lastlog -u $USUARIO
echo "===================================================================================="
exit 0
