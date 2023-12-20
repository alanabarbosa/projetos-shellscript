#!/bin/bash

frases=(
    "Que você tenha um excelente dia!"
    "AProveite ao máximo o seu dia!"
    "Desejamos a você muita protutividade hoje!"
    "QUe este dia seja cheio de realizações!"
    "Mantenha-se positivo e faça do dia de hoje incrivel!"
    "Desejamos a você muita inspiração e sucesso!"
    "Tenha um dia cheio de alegria e conquistas!"
)

dia_da_semana=$(date +%u)

echo "Bem-vindo ao sistema, $USER!"
echo "Esperamos que você tenha uma ótima experiência."
echo "Hoje é $(date)"

echo "Frase do dia: ${frases[$dia_da_semana]}"

