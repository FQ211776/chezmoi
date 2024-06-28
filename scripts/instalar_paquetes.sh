#!/usr/bin/env bash



instalar_paquetes() {
    CRE=$(tput setaf 1)
    CYE=$(tput setaf 3)
    CGR=$(tput setaf 2)
    CBL=$(tput setaf 4)
    BLD=$(tput bold)
    CNC=$(tput sgr0)

    local paquetes=("$@")  # Almacena los parámetros en un array

    is_installed() {
        pacman -Q "$1" &>/dev/null
    }

    printf "%s%sChecking for required packages...%s\n" "${BLD}" "${CBL}" "${CNC}"

    for paquete in "${paquetes[@]}"; do  # Itera sobre el array de paquetes
        if ! is_installed "$paquete"; then
            if sudo pacman -S "$paquete" --noconfirm >/dev/null 2>>RiceError.log; then
                printf "%s%s%s %shas been installed succesfully.%s\n" "${BLD}" "${CYE}" "$paquete" "${CBL}" "${CNC}"
            else
                printf "%s%s%s %shas not been installed correctly. See %sRiceError.log %sfor more details.%s\n" "${BLD}" "${CYE}" "$paquete" "${CRE}" "${CBL}" "${CRE}" "${CNC}"
            fi
        else
            printf '%s%s%s %sis already installed on your system!%s\n' "${BLD}" "${CYE}" "$paquete" "${CGR}" "${CNC}"
        fi
    done
}


 instalar_paquetes2() {
  local paquetes_sin_comentarios=()
  for paquete in "$@"; do
    paquetes_sin_comentarios+=("${paquete%%#*}")  # Elimina comentarios
  done

  is_installed() {
    pacman -Q "$1" &>/dev/null
  }

  printf "%s%sChecking for required packages...%s\n" "${BLD}" "${CBL}" "${CNC}"

  for paquete in "${paquetes_sin_comentarios[@]}"; do
    if ! is_installed "$paquete"; then
      if sudo pacman -S "$paquete" --noconfirm >/dev/null 2>>RiceError.log; then
        printf "%s%s%s %shas been installed succesfully.%s\n" "${BLD}" "${CYE}" "$paquete" "${CBL}" "${CNC}"
      else
        printf "%s%s%s %shas not been installed correctly. See %sRiceError.log %sfor more details.%s\n" "${BLD}" "${CYE}" "$paquete" "${CRE}" "${CBL}" "${CRE}" "${CNC}"
      fi
    else
      printf '%s%s%s %sis already installed on your system!%s\n' "${BLD}" "${CYE}" "$paquete" "${CGR}" "${CNC}"
    fi
  done
}
