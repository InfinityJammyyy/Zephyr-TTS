#!/bin/bash

echo "Creating LLM-TTS folder in home directory."
sudo mkdir -p ~/LLM-TTS
echo "Installing ollama"
curl -fsSL https://ollama.com/install.sh | sh
echo "Grabbing the stablelm-zephyr LLM with ollama."
ollama pull stablelm-zephyr
echo "Installing ollama module, and the coqui-tts module with pip."
pip install ollama coqui-tts --break-system-packages
echo "Installing Mplayer with your package manager."

if [ -x "$(command -v apt-get)" ]; then
apt-get update -y
apt-get install mplayer -y
echo "Installation complete!"

elif [ -x "$(command -v pacman)" ]; then
pacman -Syu -y
pacman -S mplayer -y
echo "Installation complete!"

elif [ -x "$(command -v pkg)" ]; then
pkg update -y
pkg install mplayer -y
echo "Installation complete!"

else
echo "Unsupported distribution (Are you running Gentoo or LFS? Just install mplayer via your package manager and continue!)"
exit 1
fi
