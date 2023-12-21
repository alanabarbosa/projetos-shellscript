#!/bin/bash

PACOTE="trash-cli"

# Verifica se o pacote está instalado
if dpkg -l | grep -q $PACOTE; then
    # Verifica se a lixeira está vazia
    if [ -z "$(trash-list)" ]; then
        echo "A lixeira já está vazia"
    else
        # Se a lixeira não estiver vazia, esvazia
        trash-empty
        echo "Items excluídos com sucesso"
    fi
else
    echo "$PACOTE não está instalado"
    read -p "Deseja instalar o pacote (y/n)?: " RESPOSTA

    if [ "$RESPOSTA" = "y" ] || [ "$RESPOSTA" = "Y" ]; then
        sudo apt-get install $PACOTE
        echo "Instalado com sucesso"
        echo "Verificando a lixeira"
        if trash-list &> /dev/null; then
            echo "A lixeira já está vazia"
        else
            trash-empty
            echo "Items excluídos com sucesso"
        fi
    else
        echo "Encerrando o programa"
    fi
fi

