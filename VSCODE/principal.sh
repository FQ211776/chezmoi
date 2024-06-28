#!/bin/bash

# Directorio del script actual
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Directorio que contiene los scripts a llamar (relativo al script actual)
SCRIPTS_DIR="$SCRIPT_DIR/scripts"

backup_folder="$HOME/.RiceBackup"
backup_path="$backup_folder/${folder}_$date"


# Función para cargar un script y sus funciones
cargar_script() {
    local script_path="$SCRIPTS_DIR/$1"

    if [[ -f "$script_path" ]]; then
        source "$script_path"
    else
        echo "Error: El script '$1' no se encontró en $SCRIPTS_DIR"
        exit 1
    fi
}

# Cargar scripts necesarios (ajusta los nombres según tus scripts)
cargar_script "utilidades.sh"
cargar_script "logo.sh"
cargar_script "logos.sh"
cargar_script "colorsBashScript.sh"
cargar_script "menuPrincipal.sh"
cargar_script "zsh_install.sh"
# cargar_script "instalar_paquetes.sh"
cargar_script "m3.sh"



# instalar_paquetes alacritty neovim firefox

# instalar_paquetes2 "firefox   # Navegador web \
# git          # Sistema de control de versiones \
# nano         # Editor de texto simple"

paquetes=(
    "ripgrep" \  # Repositorio oficial
    "lazygit"  \  # AUR
    "duf" \  # Repositorio oficial (DiskUsage/duf)
    "bottom" \  # AUR
    "python" \  # Repositorio oficial
    "nodejs" \  # Repositorio oficial (Node.js)
    "npm" # Repositorio oficial (Node Package Manager)
)

instalar_paquetes "${paquetes[@]}"

# instalar_paquetes $paquetes
# instalar_paquetes2 $paquetes

# # inicio del script
# logos


# color_echo -c "Este" -b -r "es" -g "un" -w "ejemplo" -o "con" -p "muchos" -w "colores" -y "y negrita"
# display_menu
# logo "Welcome!"

# main() {
#     check_gum
#     check_dialog
#     while :; do
#         display_menu
#         read -rp "Enter your choice: " CHOICE
#         echo

#         case $CHOICE in
#             1) Instalar_paquetes_adicionales ;;
#             2) desde_aur ;;
#             3) Instalar_repositorio ;;
#             4) Instalar_dotfiles ;;
#             5) zsh_ ;;
#             6) fish_ ;;
#             q) clear && exit ;;
#             *)
#                 gum style --foreground 50 "Invalid choice. Please select a valid option."
#                 echo
#             ;;
#         esac
#         sleep 1
#     done
# }

# main
# Resto de tu script principal...
