#!/bin/bash

if [ "$EUID" -eq 0 ]
    then
      echo "Você é root! Lembre-se que com grandes poderes vem grandes responsabilidades!"
    else 
      echo "Você nao é root! Então fique mais tranquilo!"
fi
exit 0
