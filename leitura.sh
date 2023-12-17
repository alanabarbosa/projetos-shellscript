#!/bin/bash

if [ -1 $1 ]; then
 echo escreva o seu nome
read NAME
 else
	 NAME=$1
 fi
 	echo você digitou o texto $NAME
exit 0
