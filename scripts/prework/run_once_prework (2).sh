#!/bin/bash
set -e

CRE=$(tput setaf 1)
CYE=$(tput setaf 3)
CGR=$(tput setaf 2)
CBL=$(tput setaf 4)
BLD=$(tput bold)
CNC=$(tput sgr0)


logo () {

    local text="${1:?}"
    echo -en "
	               %%%
	        %%%%%//%%%%%
	      %%************%%%
	  (%%//############*****%%
	%%%%%**###&&&&&&&&&###**//
	%%(**##&&&#########&&&##**
	%%(**##*****#####*****##**%%%
	%%(**##     *****     ##**
	   //##   @@**   @@   ##//
	     ##     **###     ##
	     #######     #####//
	       ###**&&&&&**###
	       &&&         &&&
	       &&&////   &&
	          &&//@@@**
	            ..***
    z0mbi3 Dotfiles\n\n"
    printf ' %s [%s%s %s%s %s]%s\n\n' "${CRE}" "${CNC}" "${CYE}" "${text}" "${CNC}" "${CRE}" "${CNC}"
}


# # Set window title
# echo -ne "\033]0;Initial System Setup\007"


# Function to display the menu
display_menu() {
  clear
  gum style --foreground 212 --border double --padding "1 1" --margin "1 1" --align center "Initial System Setup"
  echo
  gum style --foreground 142 "Hello $USER, please select an option. Press 'i' for the Wiki."
  echo
  gum style --foreground 35 "1. Configurar SSH"
  gum style --foreground 35 "2. Clonar .gitconfig"
  gum style --foreground 35 "3. Configurar GPG"
  gum style --foreground 35 "q. Salir"
}

# # Function to handle errors and prompt user
# handle_error() {
#   echo
#   gum style --foreground 196 "An error occurred. Would you like to retry or go back to the main menu? (r/m)"
#   read -rp "Enter your choice: " choice
#   case $choice in
#     r|R) exec "$0" ;;
#     m|M) clear && exec xero-cli -m ;;
#     *) gum style --foreground 50 "Invalid choice. Returning to menu." ;;
#   esac
#   sleep 3
#   clear && exec "$0"
# }

# # Function to handle Ctrl+C
# handle_interrupt() {
#   echo
#   gum style --foreground 190 "Script interrupted. Do you want to exit or restart the script? (e/r)"
#   read -rp "Enter your choice: " choice
#   echo
#   case $choice in
#     e|E) exit 1 ;;
#     r|R) exec "$0" ;;
#     *) gum style --foreground 50 "Invalid choice. Returning to menu." ;;
#   esac
#   sleep 3
#   clear && exec "$0"
# }

# # Trap errors and Ctrl+C
# trap 'handle_error' ERR
# trap 'handle_interrupt' SIGINT

# # Function to open Wiki
# open_wiki() {
#   gum style --foreground 33 "Opening Wiki..."
#   sleep 3
#   xdg-open "https://github.com/xerolinux/xlapit-cli/wiki/Toolkit-Features#system-setup" > /dev/null 2>&1
#   clear and exec "$0"
# }

# # Function for each task
# install_pipewire_bluetooth() {
#   gum style --foreground 35 "Installing PipeWire/Bluetooth Packages..."
#   sleep 2
#   echo
#   sudo pacman -S --needed --noconfirm gstreamer gst-libav gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-plugins-good libdvdcss alsa-utils alsa-firmware pavucontrol lib32-pipewire-jack libpipewire pipewire-v4l2 pipewire-x11-bell pipewire-zeroconf realtime-privileges sof-firmware ffmpeg ffmpegthumbs ffnvcodec-headers
#   sudo pacman -S --needed --noconfirm bluez bluez-utils bluez-plugins bluez-hid2hci bluez-cups bluez-libs bluez-tools
#   sudo systemctl enable --now bluetooth.service
#   gum style --foreground 35 "PipeWire/Bluetooth Packages installation complete!"
#   sleep 3
#   exec "$0"
# }

# set_pacman_parallel_downloads() {
#   gum style --foreground 35 "Activating Pacman Parallel Downloads..."
#   sleep 2
#   echo
#   sudo sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 10/' /etc/pacman.conf
#   sudo pacman -Syy
#   gum style --foreground 35 "Pacman Parallel Downloads activated!"
#   sleep 3
#   exec "$0"
# }

# activate_flathub_repositories() {
#   gum style --foreground 35 "Activating Flathub Repositories..."
#   sleep 2
#   echo
#   sudo pacman -S --noconfirm --needed flatpak
#   sudo flatpak remote-modify --default-branch=23.08 flathub system
#   gum style --foreground 35 "Flathub Repositories activated! Please reboot."
#   sleep 3
#   exec "$0"
# }

# enable_multithreaded_compilation() {
#   gum style --foreground 35 "Enabling Multithreaded Compilation..."
#   sleep 2
#   echo
#   numberofcores=$(grep -c ^processor /proc/cpuinfo)
#   if [ "$numberofcores" -gt 1 ]; then
#     sudo sed -i "s/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$((numberofcores+1))\"/" /etc/makepkg.conf
#     sudo sed -i "s/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -z - --threads=0)/" /etc/makepkg.conf
#     sudo sed -i "s/COMPRESSZST=(zstd -c -z -q -)/COMPRESSZST=(zstd -c -z -q - --threads=0)/" /etc/makepkg.conf
#     sudo sed -i "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar.zst'/" /etc/makepkg.conf
#   fi
#   gum style --foreground 35 "Multithreaded Compilation enabled!"
#   sleep 3
#   exec "$0"
# }

# install_gui_package_managers() {
#   gum style --foreground 35 "Installing 3rd-Party GUI Package Managers..."
#   sleep 2
#   echo
#   PACKAGES=$(dialog --checklist "Select GUI Package Managers to install:" 20 60 10 \
#     "OctoPi" "Octopi Package Manager" off \
#     "PacSeek" "PacSeek Package Manager" off \
#     "Pamac-All" "Pamac-All Package Manager" off \
#     "BauhGUI" "Bauh GUI Package Manager" off 3>&1 1>&2 2>&3)
#   for PACKAGE in $PACKAGES; do
#     case $PACKAGE in
#       "OctoPi") $AUR_HELPER -S --needed octopi alpm_octopi_utils ;;
#       "PacSeek") $AUR_HELPER -S --needed pacseek-bin pacfinder ;;
#       "Pamac-All") $AUR_HELPER -S --needed pamac-all pamac-cli libpamac-full ;;
#       "BauhGUI") $AUR_HELPER -S --needed bauh ;;
#     esac
#   done
#   gum style --foreground 35 "3rd-Party GUI Package Managers installation complete!"
#   sleep 3
#   exec "$0"
# }

# add_chaotic_aur() {
#   gum style --foreground 69 "Adding Chaotic-AUR Repository..."
#   sleep 2
#   echo
#   sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
#   sudo pacman-key --lsign-key 3056513887B78AEB
#   sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
#   sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
#   echo -e '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a /etc/pacman.conf
#   sudo pacman -Syy
#   gum style --foreground 69 "Chaotic-AUR Repository added!"
#   sleep 3
#   exec "$0"
# }

# add_cachyos() {
#   gum style --foreground 196 "Adding CachyOS Repositories..."
#   sleep 2
#   echo
#   cd ~ && curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
#   tar xvf cachyos-repo.tar.xz && cd ~/cachyos-repo
#   sudo ./cachyos-repo.sh
#   gum style --foreground 196 "CachyOS Repositories added!"
#   sleep 3
#   exec "$0"
# }

Instalar_paquetes_adicionales() {

logo "Install packages"

dependencias=(github-cli hub diff-so-fancy gum dialog) 

is_installed() {
    pacman -Q "$1" &> /dev/null
}

printf "%s%sChecking for required packages...%s\n" "${BLD}" "${CBL}" "${CNC}"
	for paquete in "${dependencias[@]}"; do
		if ! is_installed "$paquete"; then
			if sudo pacman -S "$paquete" --noconfirm >/dev/null 2>> RiceError.log; then
				printf "%s%s%s %shas been installed succesfully.%s\n" "${BLD}" "${CYE}" "$paquete" "${CBL}" "${CNC}"
				sleep 1
			else
				printf "%s%s%s %shas not been installed correctly. See %sRiceError.log %sfor more details.%s\n" "${BLD}" "${CYE}" "$paquete" "${CRE}" "${CBL}" "${CRE}" "${CNC}"
				sleep 1
			fi
		else
			printf '%s%s%s %sis already installed on your system!%s\n' "${BLD}" "${CYE}" "$paquete" "${CGR}" "${CNC}"
			sleep 1
		fi
	done







sleep 2
clear

}


Configurar_ssh (){
Instalar_paquetes_adicionales
gh auth login
}

Clone_gitconfig (){
  ########## ---------- Cloning the Rice! ---------- ##########

repo_dir="$HOME/my-dev-branch"

# Verifies if the folder of the repository exists, and if it does, deletes it
if [ -d "$repo_dir" ]; then
    printf "Removing existing dotfiles repository\n"
    rm -rf "$repo_dir"
fi

# Clone the repository
printf "Cloning dotfiles from %s\n" "$repo_url"
git clone --depth=1 -b my-dev-branch git@github.com:FQ211776/dotfiles_arch.git "$HOME"/my-dev-branch
cp -f "$HOME"/my-dev-branch/custom/home/.gitconfig "$HOME"
sleep 2
clear

########## ---------- Preparing Folders ---------- ##########

# Verifies if the archive user-dirs.dirs doesn't exist in ~/.config
if [ ! -e "$HOME/.config/user-dirs.dirs" ]; then
    xdg-user-dirs-update
fi
  
}


Configurar_gpg (){
 ########## ---------- Add GPG Key ---------- ##########
gh auth refresh -s write:gpg_key
gpg --gen-key
sleep 2
gpg --list-keys
sleep 15
printf "gpg --armor --export *** | gh gpg-key add -\n"
#gpg --armor --export *** | gh gpg-key add -
geany "$HOME"/.gitconfig

rm -rf ~/test && mkdir ~/test && cd ~/test && git init && echo "test" >> test && git add test && git commit -m "test" && git log --show-signature && cd .. && rm -rf test
   
}


main() {
   
  while :; do
    display_menu
    read -rp "Enter your choice: " CHOICE
    echo

    case $CHOICE in
      1) Configurar_ssh ;;
      2) Clone_gitconfig ;;
      3) Configurar_gpg ;;
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