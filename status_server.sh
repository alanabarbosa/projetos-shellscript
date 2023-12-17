#!/bin/bash

echo "Hostname: $(hostname)"
echo "Data atual: $(date)"
echo "Versão atual do kernel e arquiquetura da CPU: $(uname -rp)"

echo "Uso de CPU:"
sar -u 1 1 | grep -v "Linux"
echo ""
echo "Uso de RAM:"
sar -r 1 1 | grep -v "Linux"
echo ""
echo "Uso de SWAP:"
sar -S 1 1 | grep -v "Linux"
echo ""

echo "Atual I/O do disco:"
sar -d 1 1 | grep -E "(DEV|sd|vd)" | grep -v "Linux"
echo ""

echo "Uso atual da largura de banda:"
sar -n DEV 1 1 | grep -v lo | grep -v "Linux"





