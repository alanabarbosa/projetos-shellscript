#!/bin/bash

if [ ! -d $HOME/Outros ]; then
	mkdir $HOME/Outros
fi

DOWNLOADS=$HOME/Downloads/*
DOCUMENTS=$HOME/Documentos
IMAGES=$HOME/Imagens
MUSIC=$HOME/Música
VIDEOS=$HOME/Vídeos
OTHERS=$HOME/Outros

file_count=$(ls -A "$HOME/Downloads" | wc -l)

if [ "$file_count" -eq 0  ]; then
	echo "Não existem novos arquivos baixados."
	exit 1
fi
	

for ARCHIVE in $DOWNLOADS
do
	if [ -e "$ARCHIVE" ]; then
		type=$(file -b --mime-type "$ARCHIVE" | cut -d'/' -f2)
		
		case "$type" in 
			"jpeg" | "png" | "jpg" | "webp")
				echo "Imagens encontradas: "
				echo "$ARCHIVE"
				echo "Movendo images..."
				mv "$ARCHIVE" "$IMAGES"
				echo "Imagens movidas para o diretório $IMAGES"
				echo				
				;;
			"mp4" | "3gp" | "avi")
				echo "Videos encontrados: "
                                echo "$ARCHIVE"
                                echo "Movendo vídeos..."
                                mv "$ARCHIVE" "$VIDEOS"
                                echo "Vídeos movidos para o diretório $VIDEOS"
                                echo
                                ;;
			"pdf" | "ai" | "psd" | "odt" | "zip" | "x-xz")
				echo "Documentos encontrados: "
                                echo "$ARCHIVE"
                                echo "Movendo documentos..."
                                mv "$ARCHIVE" "$DOCUMENTS"
                                echo "Documentos movidos para o diretório $DOCUMENTS"
                                echo
                                ;; 
			"mp3" | "mpeg" | "wav" | "amr" | "m4a")
				echo "Arquivos de áudio encontrados: "
                                echo "$ARCHIVE"
                                echo "Movendo arquivos de áudio..."
                                mv "$ARCHIVE" "$MUSIC"
                                echo "Arquivo de áudio movidos para o diretório $MUSIC"
                                echo
                                ;; 
			*)
			        if [ -d "$ARCHIVE" ]; then
				    echo "Diretório encontrado: $ARCHIVE"
				    echo "Movendo diretório..."
				    mv "$ARCHIVE" "$DOCUMENTS"
				    echo "Diretório movido para o diretório $DOCUMENTS"
				else
					echo "Demais arquivos encontrados: "
		                        echo "$ARCHIVE"
		                        echo "Movendo arquivos.."
		                        mv "$ARCHIVE" "$OTHERS"
		                        echo "Demais arquivos movidos para o diretório $OTHERS"		        
		               fi
		                        echo
		               ;;
		esac
	fi	
done
