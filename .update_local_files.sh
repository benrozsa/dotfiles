#!/bin/bash

location=$(eval 'pwd')
echo $location

cp $location/.bash_aliases ~/
cp $location/.zshrc ~/
cp $location/.vimrc ~/
cp "$location/.vscode/settings.json" ~/Library/Application\ Support/Code/User/

