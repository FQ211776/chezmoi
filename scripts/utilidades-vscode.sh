#!/bin/bash

extension-list-vscode() {
    logo "Creando listado de Extenciones VSCode"
    rm --f ~/.local/share/chezmoi/VSCODE/temp-extensions-vscode.txt
    code --list-extensions >~/.local/share/chezmoi/VSCODE/temp-extensions-vscode.txt
}

extension-list-vscodeInsiders() {
    logo "Creando listado de Extenciones VSCode Insiders"
    rm --f ~/.local/share/chezmoi/VSCODE/temp-extensions-vscodeInsiders.txt
    code --list-extensions >~/.local/share/chezmoi/VSCODE/temp-extensions-vscodeInsiders.txt

}

extension-install-vscode() {
    logo "Instalando Extenciones en VSCode"
    cat "$HOME"/.local/share/chezmoi/VSCODE/extensions.txt | while read extension || [[ -n $extension ]]; do
        code --install-extension "$extension" --force
    done

}

extension-install-vscodeInsiders() {
    logo "Instalando Extenciones en VSCode Insiders"
    # cat $HOME/.local/share/chezmoi/VSCODE/extensionsInsiders.txt | while read extension || [[ -n $extension ]]; do
    #     code-insiders --install-extension $extension --force
    # done

    cat extensionsInsiders.txt | xargs -n 1 code-insiders --install-extension
}

settings_update_vscode() {
    logo "Actualizando copia en Chezmoi de settings y Keybindings de VSCode"
    chezmoi add -r ~/.config/Code/User/settings.json
    chezmoi add -r ~/.config/Code/User/keybindings.json

}

settings_update_vscodeInsiders() {
    logo "Actualizando copia en Chezmoi de settings y Keybindings de VSCode Insiders"
    chezmoi add -r ~/.config/'Code - Insiders'/User/settings.json
    chezmoi add -r ~/.config/'Code - Insiders'/User/keybindings.json

}

meld_vscode_installed() {
    logo "Comparando extenciones instaladas entre VSCode y VSCode Insiders"
    meld "$HOME"/.local/share/chezmoi/VSCODE/temp-extensions-vscode.txt "$HOME"/.local/share/chezmoi/VSCODE/temp-extensions-vscode-insiders.txt
    meld file:///home/rob/.config/Code/User/settings.json
    file:///home/rob/.config/Code%20-%20Insiders/User/settings.json
    meld file:///home/rob/.config/Code/User/keybindings.json
    file:///home/rob/.config/Code%20-%20Insiders/User/keybindings.json
}

meld_vscode_sourceOfTruth() {
    logo "En proceso"
}

meld_vscodeInsiders_sourceOfTruth() {
    logo "En proceso"

}
