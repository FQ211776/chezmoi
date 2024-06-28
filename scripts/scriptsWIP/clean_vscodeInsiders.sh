#!/bin/bash

# Directories to remove (customize if needed)
VVSCODE_CONFIG="$HOME/.config/'Code - Insiders'"
VVSCODE_CACHE="$HOME/.cache/'Code - Insiders'"
VVSCODE_EXTENSIONS="$HOME/.vscode-insiders"  # Corrected path

# # Check if running as root (recommended for thoroughness)
# if [[ $EUID -ne 0 ]]; then
#   echo "This script is best run with sudo for complete removal."
#   exit 1
# fi

# # Find and remove VSCode binaries
# VSCODE_BINARIES=$(which code || find /usr/bin -name "code")
# if [[ -n $VSCODE_BINARIES ]]; then
#   rm -rfv $VSCODE_BINARIES
# else
#   echo "VSCode binary not found in standard locations."
# fi

# Remove common VSCode directories
if [[ -d $VVSCODE_CONFIG ]]; then rm -rfv $VVSCODE_CONFIG; fi
if [[ -d $VVSCODE_CACHE ]]; then rm -rfv $VVSCODE_CACHE; fi
if [[ -d $VVSCODE_EXTENSIONS ]]; then rm -rfv $VVSCODE_EXTENSIONS; fi  # Corrected syntax
rm -rfv $HOME/.cache/'Code - Insiders'
rm -rfv Code\ -\ Insiders/ 
# Check for additional VSCode-related files
echo "Searching for additional VSCode-related files..."
# find $HOME -name "*code*" -print
