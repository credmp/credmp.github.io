#!/usr/bin/bash

sudo apt install -y exa ripgrep bat
mkdir ~/.local/bin
wget https://github.com/credmp/hed/releases/latest/download/hed -O ~/.local/bin/hed
chmod +x ~/.local/bin/hed

echo export PATH=\$PATH:~/.local/bin >> ~/.bashrc
echo alias grep='rg'  >> ~/.bashrc
echo alias ls='exa -alg --group-directories-first'  >> ~/.bashrc
echo alias cat='batcat'  >> ~/.bashrc

source ~/.bashrc
