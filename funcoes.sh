#!/bin/bash

#Funções
cumprimentar_usuario() {
    while true; do
        read -p "Qual o seu nome? " name

        # Verificando se o nome foi fornecido
        if [ -z "$name" ]; then
            echo "Por favor, forneça um nome."
        else
            echo "Olá, $name! Bem-vindo à nossa função Shell Script."
            break  # Sair do loop se o nome foi fornecido com sucesso
        fi
    done
}

# Chamar a função
cumprimentar_usuario

