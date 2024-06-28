#!/bin/bash

instalar_paquetes() {

CRE=$(tput setaf 1)
CYE=$(tput setaf 3)
CGR=$(tput setaf 2)
CBL=$(tput setaf 4)
BLD=$(tput bold)
CNC=$(tput sgr0)


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
is_installed() {
        pacman -Q "$1" &>/dev/null}

         if ! is_installed "$paquete"; then
            if sudo pacman -S "$paquete" --noconfirm >/dev/null 2>>RiceError.log; then
                printf "%s%s%s %shas been installed succesfully.%s\n" "${BLD}" "${CYE}" "$paquete" "${CBL}" "${CNC}"
                sleep 1
            # else
            #     printf "%s%s%s %shas not been installed correctly. See %sRiceError.log %sfor more details.%s\n" "${BLD}" "${CYE}" "$paquete" "${CRE}" "${CBL}" "${CRE}" "${CNC}"
            #     sleep 1
            fi
        else
            printf '%s%s%s %sis already installed on your system!%s\n' "${BLD}" "${CYE}" "$paquete" "${CGR}" "${CNC}"
            sleep 1
            fi
            else
        # El paquete está en AUR
        yay -S --noconfirm "$paquete"
    fi
done

echo "¡Instalación completa!"
}
