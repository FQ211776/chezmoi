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
cargar_script "utilidades-vscode.sh"
cargar_script "logo.sh"
cargar_script "logos.sh"
cargar_script "colorsBashScript.sh"
cargar_script "menuPrincipal.sh"



# inicio del script


main() {
check_gum
    check_dialog
    while :; do
        display_menu_vscode
        read -rp "Enter your choice: " CHOICE
        echo

        case $CHOICE in
            1) extension-install-vscode ;;
            2) extension-install-vscodeInsiders ;;
            3) extension-list-vscode ;;
            4) extension-list-vscodeInsiders ;;
            5) settings_update_vscode ;;
            6) settings_update_vscodeInsiders ;;
            7) meld_vscode_sourceOfTruth ;;
            8) meld_vscodeInsiders_sourceOfTruth ;;
            9) meld_vscode_installed;;
            q) clear && exit ;;
            *)
                gum style --foreground 50 "Invalid choice. Please select a valid option."
                echo
            ;;
        esac
        sleep 1
    done
}

main
