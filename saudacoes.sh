#!/bin/bash

CURRENTDATE=$(date +"%H")
CURRENTDAY=$(date +"%d/%m/%y")

if [[ "$CURRENTDATE" -gt 6 && "$CURRENTDATE" -lt 12 ]]; then
	echo "Bom dia $USER!!"
	echo "Hoje é $CURRENTDAY"
elif [[ "$CURRENTDATE" -gt 12 && "$CURRENTDATE" -lt 18 ]]; then
	echo "Boa tarde $USER!!"
	echo "Hoje é $CURRENTDAY"
else
	echo "Boa noite $USER!!"
	echo "Hoje é $CURRENTDAY"
fi
	
