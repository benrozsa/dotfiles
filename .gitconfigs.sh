#!/bin/bash

git config --global user.name "Bence Rozsa"
git config --global user.email "robence@gmail.com"
git config --global core.editor vim

git config --global alias.co checkout
git config --global alias.c commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.pull pull --rebase
git config --global alias.hist "log --graph --pretty=format:'%C(auto)%h -%d %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

git config --global init.defaultBranch main

git config --global pull.rebase true
git config --global rebase.autoStash true
git config --global push.default current
git config --global push.autoSetupRemote true

