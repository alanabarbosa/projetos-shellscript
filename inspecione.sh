#!/bin/bash


DOCUMENTS="Documentos"
IMAGES="Imagens"
MUSIC="Música"
VIDEOS="Vídeos"
DIR=/home/*

for USER_DIR in $DIR; do
	if [ -d "$USER_DIR" ]; then		
		
		USERNAME=$(basename "$USER_DIR")
		DOCUMENTS_PATH="${USER_DIR}/${DOCUMENTS}"
		IMAGES_PATH="${USER_DIR}/${IMAGES}"
		MUSIC_PATH="${USER_DIR}/${MUSIC}"
		VIDEOS_PATH="${USER_DIR}/${VIDEOS}"
		
		if [ -d "$DOCUMENTS_PATH" ] || [ -d "$IMAGES_PATH" ] || [ -d "$MUSIC_PATH" ] || [ -d "$VIDEOS_PATH" ]; then            			
            			
            			DOCUMENTS_COUNT=$(ls -A "$DOCUMENTS_PATH" | wc -l)     
            			IMAGES_COUNT=$(ls -A "$IMAGES_PATH" | wc -l)
            			MUSIC_COUNT=$(ls -A "$MUSIC_PATH" | wc -l)
            			VIDEOS_COUNT=$(ls -A "$VIDEOS_PATH" | wc -l)
            			       			
				echo "======================="
            			echo
            			echo "Usuário: $USERNAME"
            			echo "Documentos: $DOCUMENTS_COUNT"
            			echo "Imagens: $IMAGES_COUNT"
            			echo "Músicas: $MUSIC_COUNT"
            			echo "Vídeos: $VIDEOS_COUNT" 
            			echo
            	else
            			echo
            			echo "======================="
            			echo
            			echo "Usuário: $USERNAME não possui os diretórios" 
            			echo
            			echo "======================="
	fi	fi
done
