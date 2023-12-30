#!/bin/bash

echo "==================== RELATÓRIO ===================="
echo ""

MAQUINA=$(hostname)
DATE=$(date)
ATIVO=$(uptime)
VERSION=$(uname -r)
QTDCPUS=$(cat /proc/cpuinfo | grep "model name" | wc -l)
MODELOCPU=$(cat /proc/cpuinfo | grep "model name" | head -n1 | cut -c14-)
MEMORIA=$(expr $(cat /proc/meminfo | grep MemTotal | tr -d ' ' | cut -d: -f2 | tr -d kB) / 1024) 
INFOPARTICOES=$(df -h | egrep -v '(ympfs|udev)')

echo "Relatório da Máquina: $MAQUINA"
echo ""
echo -e "Data e Hora atual: $DATE"
echo ""
echo -e "Tempo de atividade: $ATIVO"
echo ""
echo -e "Versão do Kernel: $VERSION"
echo ""
echo -e "Quantidade de CPUs/Cores: $QTDCPUS"
echo ""
echo -e "Modelo da CPU: $MODELOCPU"
echo ""
echo "Memória Total: $MEMORIA MB"
echo ""
echo -e "Informações sobre as particões: $INFOPARTICOES"
