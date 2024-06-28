#!/bin/bash

# Directories to remove (customize if needed)
VSCODE_CONFIG="$HOME/.config/Code"
VSCODE_CACHE="$HOME/.cache/Code"
VSCODE_EXTENSIONS="$HOME/.vscode"  # Corrected path

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
if [[ -d $VSCODE_CONFIG ]]; then rm -rfv $VSCODE_CONFIG; fi
if [[ -d $VSCODE_CACHE ]]; then rm -rfv $VSCODE_CACHE; fi
if [[ -d $VSCODE_EXTENSIONS ]]; then rm -rfv $VSCODE_EXTENSIONS; fi  # Corrected syntax

# Check for additional VSCode-related files
echo "Searching for additional VSCode-related files..."
find $HOME -name "*code*" -print
