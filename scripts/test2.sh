#!/usr/bin/env bash
autoload -U colors
colors

CRE=$'%{\e[31m%}'  # Rojo
CYE=$'%{\e[33m%}'  # Amarillo
CGR=$'%{\e[32m%}'  # Verde
CBL=$'%{\e[34m%}'  # Azul
BLD=$'%{\e[1m%}'   # Negrita
CNC=$'%{\e[0m%}'   # Restablecer color

repo="mi-repositorio"
folder="mi-carpeta"

printf 'ssssssssssssUpdating dotfiles from %s in %s\n' $repo $CGR $folder $CYE
