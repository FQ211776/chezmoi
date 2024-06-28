#!/usr/bin/env bash

# Script to install z0mbi3's dotfiles
# Author: z0mbi3
# URL: https://github.com/gh0stzk

# Color Variables (Improved readability)
CRE="\033[38;5;1m"  # Light Red
CYE="\033[38;5;3m"  # Yellow
CGR="\033[38;5;2m"  # Green
CBL="\033[38;5;4m"  # Blue
BLD="\033[1m"       # Bold
CNC="\033[0m"       # Reset

backup_folder="$HOME/.RiceBackup"
date=$(date +%Y%m%d-%H%M%S)

# --- Functions ---

printLogo() {
  # ... (Logo content remains the same)
}

checkAndInstall() {
  local package="$1"
  command -v "$package" >/dev/null 2>&1 || {
    echo >&2 "$package is not installed. Installing..."
    sudo pacman -S --noconfirm "$package"
  }
}

displayMenu() {
  clear
  # ... (Menu display remains the same, using 'gum style')
}

installAdditionalPackages() {
  # ... (Package installation logic remains the same)
}

installFromAUR() {
  # ... (AUR package installation logic remains the same)
}

installDotfiles() {
  # ... (Dotfiles installation logic remains the same)
}

setupZsh() {
  # ... (Zsh setup logic remains the same)
}

setupFish() {
  # ... (Fish setup logic remains the same)
}

main() {
  checkAndInstall gum
  checkAndInstall dialog

  while :; do
    displayMenu
    read -rp "Enter your choice: " CHOICE

    case $CHOICE in
      1) installAdditionalPackages ;;
      2) installFromAUR ;;
      3) installDotfiles ;;
      4) setupZsh ;;
      5) setupFish ;;
      q) clear && exit ;;
      *) gum style --foreground 50 "Invalid choice." ;;
    esac

    sleep 1
  done
}

# --- Script Execution ---

# Input Validation (Moved for better structure)
if [[ "$(id -u)" == 0 ]]; then
  echo "This script MUST NOT be run as root user."
  exit 1
fi

if [[ "$PWD" != "$HOME" ]]; then
  printf "%s%sThe script must be executed from the HOME directory.%s\n" "$BLD" "$CYE" "$CNC"
  exit 1
fi

# Welcome Message
printLogo "Welcome!"
printf '%s%sThis script will ...%s\n\n' "$BLD" "$CRE" "$CNC"  # ... (Rest of the message)

while true; do
  read -rp "Do you wish to continue? [y/N]: " yn
  case $yn in
    [Yy]* ) break ;;
    [Nn]* ) exit ;;
    * ) echo "Error: Just write 'y' or 'n'" ;;
  esac
done

clear
main
