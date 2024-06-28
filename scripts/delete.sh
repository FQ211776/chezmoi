#!/bin/bash

# Lista de paquetes a instalar (repositorios oficiales y AUR)
paquetes=(
    "ripgrep"         # Repositorio oficial
    "lazygit"         # AUR
    "duf"             # Repositorio oficial (DiskUsage/duf)
    "bottom"          # AUR
    "python"          # Repositorio oficial
    "nodejs"          # Repositorio oficial (Node.js)
    "npm"             # Repositorio oficial (Node Package Manager)
)

# Actualizar repositorios
sudo pacman -Syu

# Instalar yay (si no lo tienes) para instalar desde AUR
if ! command -v yay &> /dev/null; then
    echo "Instalando yay (AUR helper)..."
    sudo pacman -S --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# Instalar paquetes
for paquete in "${paquetes[@]}"; do
    echo "Instalando $paquete..."
    if pacman -Qi "$paquete" &> /dev/null; then
        # El paquete está en los repositorios oficiales
        sudo pacman -S --noconfirm "$paquete"
    else
        # El paquete está en AUR
        yay -S --noconfirm "$paquete"
    fi
done

echo "¡Instalación completa!"
