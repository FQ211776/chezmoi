#!/bin/bash

desktopApps() {
    logo "Instalando Web Apps y accesos directos a Shell apps"
    for script in ~/.local/share/chezmoi/scripts/desktop/*.sh; do source $script; done
}
