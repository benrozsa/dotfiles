#!/bin/bash

cp ~/.bash_aliases $(eval 'pwd')
cp ~/.zshrc $(eval 'pwd') 
cp ~/.vimrc $(eval 'pwd') 
cp ~/Library/Application\ Support/Code/User/settings.json "$(eval 'pwd')/.vscode/"
cp ~/.config/fish/config.fish "$(eval 'pwd')/.config/fish/"

