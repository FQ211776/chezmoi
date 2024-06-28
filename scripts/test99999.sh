#!/bin/bash


# if diff ~/.gitconfig /home/workspace/.local/share/chezmoi/dot_gitconfig >/dev/null; then
#     # Los archivos son iguales
#     echo "Los archivos son idénticos."
#     # Aquí puedes agregar el código que quieres ejecutar si los archivos son iguales
# else
#     # Los archivos son diferentes
# 	diff ~/.gitconfig /home/workspace/.local/share/chezmoi/dot_gitconfig
#     meld ~/.gitconfig /home/workspace/.local/share/chezmoi/dot_gitconfig
#     # Aquí puedes agregar el código que quieres ejecutar si los archivos son diferentes
# fi


if diff ~/.gitconfig /home/workspace/.local/share/chezmoi/dot_gitconfig >/dev/null; then
    # Los archivos son iguales
    echo "Los archivos son idénticos."
    # Aquí puedes agregar el código que quieres ejecutar si los archivos son iguales
else
    # Los archivos son diferentes
	diff ~/.config/wezterm/ /home/workspace/.local/share/chezmoi/dot_config/wezterm/
    meld ~/.config/wezterm/ /home/workspace/.local/share/chezmoi/dot_config/wezterm/
    # Aquí puedes agregar el código que quieres ejecutar si los archivos son diferentes
fi
