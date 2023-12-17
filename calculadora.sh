#!/bin/bash

#!/bin/bash

calculadora() {
    while true; do
        echo "Escolha uma operação:"
        echo "1. Adição"
        echo "2. Subtração"
        echo "3. Multiplicação"
        echo "4. Divisão"
        echo "5. Sair"

        read -p "Digite o número da operação desejada: " opcao

        case $opcao in
            1)
                read -p "Digite o primeiro número: " num1
                read -p "Digite o segundo número: " num2
                resultado=$(echo "$num1 + $num2" | bc)
                echo "Resultado: $resultado"
                ;;
            2)
                read -p "Digite o primeiro número: " num1
                read -p "Digite o segundo número: " num2
                resultado=$(echo "$num1 - $num2" | bc)
                echo "Resultado: $resultado"
                ;;
            3)
                read -p "Digite o primeiro número: " num1
                read -p "Digite o segundo número: " num2
                resultado=$(echo "$num1 * $num2" | bc)
                echo "Resultado: $resultado"
                ;;
            4)
                read -p "Digite o primeiro número: " num1
                read -p "Digite o segundo número: " num2
                if [ "$num2" -eq 0 ]; then
                    echo "Erro: divisão por zero."
                else
                    resultado=$(echo "scale=2; $num1 / $num2" | bc)
                    echo "Resultado: $resultado"
                fi
                ;;
            5)
                echo "Saindo da calculadora. Até mais!"
                exit 0
                ;;
            *)
                echo "Opção inválida. Tente novamente."
                ;;
        esac
    done
}

# Chamar a função calculadora
calculadora


