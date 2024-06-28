#!/bin/bash

# Ruta al disco duro externo (reemplaza con la ruta correcta)
destino="/run/media/workspace/Backup/b"

# Nombre de la carpeta de respaldo (opcional)
carpeta_respaldo="respaldo_home_$(date +%Y-%m-%d)"

# Ruta completa de la carpeta de respaldo
ruta_respaldo="$destino/$carpeta_respaldo"

# Verificar si el disco externo está montado
# if ! mountpoint -q "$destino"; then
#     echo "El disco duro externo no está montado. Por favor, móntelo e intente de nuevo."
#     exit 1
# fi


# Carpetas a excluir (agrega las que necesites)
excluir=(
    "/home/Descargas"  # Ejemplo de exclusión de la carpeta "Descargas"
    "/home/.cache"     # Ejemplo de exclusión de la carpeta ".cache"
    "/home/workspace/.cache"
)

# Crear la carpeta de respaldo si no existe
mkdir -p "$ruta_respaldo"

# Construir la lista de opciones de exclusión para rsync
opciones_excluir=()
for carpeta in "${excluir[@]}"; do
    opciones_excluir+=("--exclude" "$carpeta")
done

# Realizar la copia de seguridad (rsync es recomendado para copias incrementales)
# rsync -av --progress /home/* "$ruta_respaldo"
rsync -av --progress "${opciones_excluir[@]}" /home/* "$ruta_respaldo"



echo "Copia de seguridad de la carpeta home completada en: $ruta_respaldo"
