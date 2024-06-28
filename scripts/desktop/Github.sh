cat <<EOF >~/.local/share/applications/Github.desktop
[Desktop Entry]
Version=1.0
Name=Github
Comment=Github
Exec=google-chrome-stable --app="https://github.com/FQ211776?tab=repositories" --name=Github
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/chezmoi/scripts/desktop/icons/Github.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF
