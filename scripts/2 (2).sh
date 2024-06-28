#!/bin/bash

# Actualiza los paquetes del sistema
sudo pacman -Syu --noconfirm

# Instala fish shell
sudo pacman -S fish --noconfirm

# Cambia el shell por defecto a fish
chsh -s /usr/bin/fish

# Instala curl si no está instalado (necesario para oh-my-fish)
sudo pacman -S curl --noconfirm

rm -rf ~/.local/share/omf
# Descarga e instala oh-my-fish
curl -L https://get.oh-my.fish | fish

# Instala el tema bobthefish usando oh-my-fish
fish -c "omf install bobthefish"
omf install bobthefish
set -g theme_nerd_fonts yes


echo "Fish, Oh-My-Fish y el tema bobthefish se han instalado correctamente."
echo "Por favor, cierra y vuelve a abrir tu terminal o inicia una nueva sesión para aplicar los cambios."
