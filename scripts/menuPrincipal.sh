#!/usr/bin/env bash

## Function to display the menu
display_menu() {
  clear
  gum style --foreground 212 --border double --padding "1 1" --margin "1 1" --align center "Robert Dotfiles"
  echo
  color_echo -b -y "Hello" -b -c "$USER," -b -y "please select an option. Press 'i' for the Wiki."
  echo
  color_echo -b -r "      1." -g "    Instalar" -w "paquetes adicionales no incluidos en los" -p "dotfiles originales."
  color_echo -b -r "      2." -g "    Instalar" -w "paquetes adicionales" -o "desde aur" -w "no incluidos en los" -p "dotfiles originales."
  color_echo -b -r "      3." -g "    Clonar o actualizar" -w "copia local de los" -p "dotfiles originales."
  color_echo -b -r "      4." -g "    Instalar" -w "los " -p "dotfiles originales"
  color_echo -b -r "      5." -g "    Configurar" -o "ZSH" -b -w "All in one"
  color_echo -b -r "      6." -g "    Configurar" -o "Fish" -b -w "Shell"
  color_echo -b -r "      7." -g "    Instalar" -o "Web Apps" -b -w "y accesos directos a" -o "Shell"

  echo
  color_echo -b -bl "Type your selection or " -o "'q'" -b -bl " to return to main menu."

}

## Function to display the menu
display_menu_vscode() {
  clear
  gum style --foreground 212 --border double --padding "1 1" --margin "1 1" --align center "Robert VSCODE Dotfiles"
  echo
  color_echo -b -y "Hello" -b -c "$USER," -b -y "please select an option. Press 'i' for the Wiki."
  echo
  color_echo -b -r "      1." -g "    Instalar" -w "Extensiones " -c "VSCode"
  color_echo -b -r "      2." -g "    Instalar" -w "Extensiones " -c "VSCode Insiders"
  color_echo -b -r "      3." -g "    Crear listado de " -w "Extensiones" -c "VSCode"
  color_echo -b -r "      4." -g "    Crear listado de " -w "Extensiones" -c "VSCode Insiders"
  color_echo -b -r "      5." -g "    Syncronizar hacia repo" -w "settings y keybindings" -c "VSCode"
  color_echo -b -r "      6." -g "    Syncronizar hacia repo" -w "settings y keybindings" -c "VSCode -Insiders"
  color_echo -b -r "      7." -g "    Comparar" -w "settings, keybindings y extenciones" -c "VSCode y Source of Truth"
  color_echo -b -r "      8." -g "    Comparar" -w "settings, keybindings y extenciones" -c "VSCode -Insiders y Source of Truth"
  color_echo -b -r "      9." -g "    Comparar" -w "extenciones instaladas entre " -c "VSCode y VSCode -Insiders"
  echo
  color_echo -b -bl "Type your selection or " -o "'q'" -b -bl " to return to main menu."

}
