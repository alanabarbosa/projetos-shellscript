OLDIFS=$IFS
IFS=$'\n'

read -p "Qual o nome do arquivo? " ARCHIVE
read -p "Qual o conteúdo dele? " CONTENT
read -p "Qual o tamanho total dele? " SIZE


ARCHIVE_TEXT="$ARCHIVE.txt"
SIZE_ATUAL=$(stat -c%s "$ARCHIVE_TEXT")

PERCENTUAL_TOTAL=$(( (SIZE * 100 ) / $SIZE))	
echo "Espaço disponível $SIZE bytes $PERCENTUAL_TOTAL%"
echo

printf "\n$CONTENT" > "$ARCHIVE_TEXT"
	
while true; do
    # Obtém o tamanho atual do arquivo
    SIZE_ATUAL=$(stat -c%s "$ARCHIVE_TEXT")
    
    # Calcula o percentual atual do arquivo
    PERCENTUAL=$((SIZE_ATUAL * 100 / SIZE))
    
    echo "Tamanho do arquivo $ARCHIVE_TEXT: $SIZE_ATUAL bytes (Espaço disponivel: $PERCENTUAL%)"
    echo
    
    # Verifica se o tamanho atual ultrapassou o tamanho total
    if [ $SIZE_ATUAL -ge $SIZE ]; then
        echo "Você atingiu o tamanho máximo de conteúdo."
        echo
        break
    else
        read -p "Deseja adicionar mais conteúdo (y/n): " ADICIONAR
        echo
        
        if [ "$ADICIONAR,," != "y" ]; then
            echo "Encerrando o programa..."
            break
        fi
        
        read -p "Digite o conteúdo: " CONTENT2
        echo
        
        # Adiciona o novo conteúdo ao arquivo
        printf "\n%s" "$CONTENT2" >> "$ARCHIVE_TEXT"cle
    fi
done

IFS=$OLDIFS

