#!/bin/bash

print_system_status() {
	date # Imprimir a data e hora atual.
	echo "CPU in use: $(top -bn1 | grep Cpu | awk '{print $2}')"
	echo "Memory in use: $(free -h | grep Mem | awk '{print $3}')"
	echo "Disk space available on /: $(df -k / | grep / | awk '{print $4}')"
	echo # Nova linha extra para facilitar a leitura.
}

# Imprima o status do sistema algumas vezes.
for ((i=0; i<100; i++)); do
	print_system_status
	sleep 5
done
