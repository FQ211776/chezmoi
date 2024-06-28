#!/usr/bin/env bash

# Script to install z0mbi3's dotfiles
# Author: z0mbi3
# URL: https://github.com/gh0stzk

# --- Color Variables ---
CRE="\033[38;5;1m"  # Light Red
CYE="\033[38;5;3m"  # Yellow
CGR="\033[38;5;2m"  # Green
CBL="\033[38;5;4m"  # Blue
BLD="\033[1m"       # Bold
CNC="\033[0m"       # Reset

# --- Global Variables ---
backup_folder="$HOME/.RiceBackup"
date=$(date +%Y%m%d-%H%M%S)

# --- Functions ---

printLogo() {
  local text="${1:?}"
  echo -en "
        %%%
      %%%%%//%%%%%
    %%************%%%
  (%%//############*****%%
  %%%%%**###&&&&&&&&&###**//
%%(**##&&&#########&&&##**
%%(**##*****#####*****##**%%%
%%(**##    *****    ##**
  //##   @@**  @@  ##//
    ##    **###   ##
    #######    #####//
      ###**&&&&&**###
      &&&      &&&
      &&&////  &&
        &&//@@@**
          ..***
  z0mbi3 Dotfiles\n\n"
  printf ' %s [%s%s %s%s %s]%s\n\n' "${CRE}" "${CNC}" "${CYE}" "${text}" "${CNC}" "${CRE}" "${CNC}"
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
  gum style --foreground 212 --border double --padding "1 1" --margin "1 1" --align center "Initial System Setup"
  echo
  gum style --foreground 142 "Hello $USER, please select an option. Press 'i' for the Wiki."
  echo
  gum style --foreground 35 "1. Instalar paquetes adicionales no incluidos en los dotfiles originales."
  gum style --foreground 35 "2. Instalar paquetes adicionales desde aur no incluidos en los dotfiles originales."
  gum style --foreground 35 "3. Instalar Dotfiles."
  gum style --foreground 35 "4. Instalar y configurar ZSH y Fish."
  echo
  gum style --foreground 33 "Type your selection or 'q' to return to main menu."
}

installAdditionalPackages() {
  local dependencies=(
    alacritty base-devel brightnessctl bspwm dunst feh firefox 
    geany git kitty imagemagick jq jgmenu libwebp lsd maim mpc 
    mpd neovim ncmpcpp npm pamixer pacman-contrib papirus-icon-theme 
    physlock picom playerctl polybar polkit-gnome python-gobject 
    ranger redshift rofi rustup sxhkd tmux ttf-inconsolata 
    ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-joypixels ttf-terminus-nerd 
    ueberzug webp-pixbuf-loader xclip xdg-user-dirs xdo xdotool 
    xorg-xdpyinfo xorg-xkill xorg-xprop xorg-xrandr xorg-xsetroot 
    xorg-xwininfo zsh zsh-autosuggestions zsh-history-substring-search 
    zsh-syntax-highlighting yt-dlp bat bat-extras tldr diff-so-fancy 
    geany hub github-cli peco wget eza zsh fish grml-zsh-config 
    wget xorg-xfd curl wezterm ttf-nerd-fonts-symbols-mono python-nautilus 
    noto-fonts-emoji xsel micro lazygit
  )

  isInstalled() {
    pacman -Q "$1" &> /dev/null
  }

  printLogo "Installing needed packages.."
  printf "%s%sChecking for required packages...%s\n" "$BLD" "$CBL" "$CNC"
  for package in "${dependencies[@]}"; do
    if ! isInstalled "$package"; then
      if sudo pacman -S "$package" --noconfirm &> /dev/null; then
        printf "%s%s%s %shas been installed succesfully.%s\n" "$BLD" "$CYE" "$package" "$CBL" "$CNC"
      else
        printf "%s%s%s %shas not been installed correctly. See %sRiceError.log %sfor more details.%s\n" "$BLD" "$CYE" "$package" "$CRE" "$CBL" "$CRE" "$CNC"
      fi
    else
      printf '%s%s%s %sis already installed on your system!%s\n' "$BLD" "$CYE" "$package" "$CGR" "$CNC"
    fi
    sleep 1 
  done
}

# ... (Functions installFromAUR, installDotfiles, setupZsh, setupFish remain the same)

# --- Main Script Logic ---

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

# Input Validation
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
printf '%s%sThis script will check if you have the necessary dependencies, and if not, it will install them. Then, it will clone my repository in your HOME directory.\nAfter that, it will create a backup of your files, and then copy the new files to your computer.\n\nMy dotfiles DO NOT modify any of your system configurations.\nYou will be prompted for your root password to install missing dependencies and/or to switch to zsh shell if its not your default.\n\nThis script doesnt have the potential power to break your system, it only copies files from my repository to your HOME directory.%s\n\n' "$BLD" "$CRE" "$CNC"

while true; do
  read -rp " Do you wish to continue? [y/N]: " yn
  case $yn in
    [Yy]* ) break ;;
    [Nn]* ) exit ;;
    * ) echo "Error: Just write 'y' or 'n'" ;;
  esac
done

clear
main

