#!/bin/bash

# IF ELSE
if [ -f $1 ]
then
    echo "$1 é um arquivo"
elif [ -d $1 ]
then
    echo "$1 é um diretorio"
else
    echo "eu não sei o que é \$1 is"
 fi
exit 0
