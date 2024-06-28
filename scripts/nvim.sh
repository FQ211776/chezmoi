# in ~/.config/pip/pip.conf
[global]
break-system-packages = true
-----------------

# https://lazyvim-ambitious-devs.phillips.codes/course/

pacman -S python-pip
pip install neovim
pip install pynvim

sudo pacman -S python-pipx
pipx ensurepath
sudo pipx ensurepath --global

sudo pacman -S fd ripgrep

https://docs.astronvim.com/
cargo install tree-sitter-cli

# Actualizar la lista de paquetes
sudo pacman -Syu

# Instalar los paquetes solicitados
sudo pacman -S --needed git base-devel ripgrep

# Instalar PIP (Python Package Installer)
sudo pacman -S python-pip

# Instalar Node.js y NPM (Node Package Manager)
sudo pacman -S nodejs npm

# Instalar Cargo (Rust Package Manager)
sudo pacman -S cargo

sudo pacman -S neovide
paquetes=(
	"ripgrep" # Repositorio oficial
	"lazygit" # AUR
	"duf"     # Repositorio oficial (DiskUsage/duf)
	"bottom"  # AUR
	"python"  # Repositorio oficial
	"nodejs"  # Repositorio oficial (Node.js)
	"npm"     # Repositorio oficial (Node Package Manager)
)

The Lazyman installation process consists of two steps.

Step 1, clone the Lazyman repository:

git clone https://github.com/doctorfree/nvim-lazyman $HOME/.config/nvim-Lazyman

Step 2, initialize the Lazyman Neovim configuration:

$HOME/.config/nvim-Lazyman/lazyman.sh

#On the command line, in your home directory, create a directory for global installations:
mkdir ~/.npm-global

#Configure npm to use the new directory path:
npm config set prefix '~/.npm-global'

#In your preferred text editor, open or create a ~/.profile file and add this line:
export PATH=~/.npm-global/bin:$PATH

#On the command line, update your system variables:
source ~/.profile

#To test your new configuration, install a package globally without using sudo:
npm install -g jshint

mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

[[ -e ~/.config/nvim ]] && mv ~/.config/nvim ~/.config/nvim.bak
[[ -e ~/.local/share/nvim ]] && mv ~/.config/nvim ~/.config/nvim.bak
[[ -e ~/.local/state/nvim ]] && mv ~/.config/nvim ~/.config/nvim.bak
[[ -e ~/.cache/nvim ]] && mv ~/.config/nvim ~/.config/nvim.bak

# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone --depth 1 https://github.com/theopn/theovim.git ~/.config/nvim
