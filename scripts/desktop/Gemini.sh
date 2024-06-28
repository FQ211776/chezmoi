cat <<EOF >~/.local/share/applications/Geminy.desktop
[Desktop Entry]
Version=1.0
Name=Geminy
Comment=Geminy IA
Exec=google-chrome-stable --app="https://gemini.google.com/u/0/app" --name=Gemini
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/chezmoi/scripts/desktop/icons/Gemini.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF
