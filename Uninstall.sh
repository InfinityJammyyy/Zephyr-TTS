#!/bin/bash

echo "Removing LLM-TTS folder from home directory."
rm -rf ~/LLM-TTS

echo "Uninstalling ollama"

sudo systemctl stop ollama && \
sudo systemctl disable ollama && \
sudo rm /etc/systemd/system/ollama.service && \
sudo rm $(which ollama) && \
sudo rm -r /usr/share/ollama && \
sudo userdel ollama && \
sudo groupdel ollama

echo "Uninstalling coqui-tts module with pip."
pip uninstall coqui-tts --break-system-packages -y

echo "Uninstalling Mplayer with your package manager."

if [ -x "$(command -v apt-get)" ]; then
    apt-get remove mplayer -y
    echo "Uninstallation complete!"

elif [ -x "$(command -v pacman)" ]; then
    pacman -Rs mplayer -y
    echo "Uninstallation complete!"

elif [ -x "$(command -v pkg)" ]; then
    pkg remove mplayer -y
    echo "Uninstallation complete!"

else
    echo "Unsupported distribution (Are you running Gentoo or LFS? Just uninstall mplayer via your package manager and continue!)"
    exit 1
fi