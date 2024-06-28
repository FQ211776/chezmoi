#!/usr/bin/env bash
#  ██████╗ ██╗ ██████╗███████╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗
#  ██╔══██╗██║██╔════╝██╔════╝    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
#  ██████╔╝██║██║     █████╗      ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
#  ██╔══██╗██║██║     ██╔══╝      ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
#  ██║  ██║██║╚██████╗███████╗    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
#  ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
#   Script to install my dotfiles
#   Author: z0mbi3
#   url: https://github.com/gh0stzk

clear

CRE=$(tput setaf 1)
CYE=$(tput setaf 3)
CGR=$(tput setaf 2)
CBL=$(tput setaf 4)
BLD=$(tput bold)
CNC=$(tput sgr0)

 # Variables
 backup_folder="$HOME/backups"
 folder=".oh-my-zsh"
 date=$(date +%Y%m%d_%H%M%S)
 backup_path="$backup_folder/${folder}_$date"

 # Crear carpeta de respaldo si no existe
 mkdir -p "$backup_folder"

zsh_fish(){

 gum style --foreground 35 "Setting up ZSH with p10k & OMZ Plugins..."
         sleep 2
         echo


         if [ -f ~/.zshrc ]; then
     if mv ~/.zshrc "$backup_folder"/.zshrc_"$date" 2>> RiceError.log; then
         printf "%s%s.zshrc file backed up successfully at %s%s/.zshrc_%s%s\n" "${BLD}" "${CGR}" "${CBL}" "$backup_folder" "${date}" "${CNC}"
     else
         printf "%s%sFailed to backup .zshrc file. See %sRiceError.log%s\n" "${BLD}" "${CRE}" "${CBL}" "${CNC}"
     fi
 else
     printf "%s%sThe file .zshrc does not exist, %sno backup needed%s\n" "${BLD}" "${CGR}" "${CYE}" "${CNC}"
 fi
 
 # Verificar si la carpeta .oh-my-zsh existe
 if [ -d "$HOME/$folder" ]; then
     # Mover la carpeta a la carpeta de respaldo
     if mv "$HOME/$folder" "$backup_path" 2>> RiceError.log; then
         printf "%s%s%s folder backed up successfully at %s%s%s%s\n" "${BLD}" "${CGR}" "$folder" "${CBL}" "$backup_path" "${CNC}"
     else
         printf "%s%sFailed to backup %s folder. See %sRiceError.log%s\n" "${BLD}" "${CRE}" "$folder" "${CBL}" "${CNC}"
     fi
 else
     # Mensaje si la carpeta no existe
     printf "%s%s%s folder does not exist, %sno backup needed%s\n" "${BLD}" "${CGR}" "$folder" "${CYE}" "${CNC}"
 fi
 
 
         sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
         git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
         git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
         git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
         git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
         cd $HOME/ && wget https://raw.githubusercontent.com/xerolinux/xero-fixes/main/conf/.p10k.zsh && rm ~/.zshrc && wget https://raw.githubusercontent.com/xerolinux/xero-fixes/main/conf/.zshrc
         gum style --foreground 35 "ZSH setup complete! Log out and back in."
       
logo "Changing default shell to zsh"

if [[ $SHELL != "/usr/bin/zsh" ]]; then
    printf "\n%s%sChanging your shell to zsh. Your root password is needed.%s\n\n" "${BLD}" "${CYE}" "${CNC}"
    # Cambia la shell a zsh
    chsh -s /usr/bin/zsh
    printf "%s%sShell changed to zsh. Please reboot.%s\n\n" "${BLD}" "${CGR}" "${CNC}"
else
    printf "%s%sYour shell is already zsh\nGood bye! installation finished, now reboot%s\n" "${BLD}" "${CGR}" "${CNC}"
fi

  sleep 3

}

zsh_fish
 # Restablecer colores
 tput sgr0

tput sgr0
