#!/bin/bash

# Directorio del script actual
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Directorio que contiene los scripts a llamar (relativo al script actual)
SCRIPTS_DIR="$SCRIPT_DIR/scripts"

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

# inicio del script
logos

# Ejemplo de uso de funciones de los scripts cargados
imprimir_mensaje "Hola desde el script principal"
resultado=$(sumar 5 3)
echo "Resultado de la suma: $resultado"

# Resto de tu script principal...
