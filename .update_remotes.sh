#!/bin/bash

location=$(eval 'pwd')
echo $location

cp ~/.bash_aliases $location
cp ~/.zshrc $location
cp ~/.vimrc $location
cp ~/Library/Application\ Support/Code/User/settings.json "$location/.vscode/"
cp ~/.config/fish/config.fish "$location/.config/fish/"

