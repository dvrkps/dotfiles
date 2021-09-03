#!/bin/zsh

ln -sfv ~/dotfiles/macos/.zshenv ~/.zshenv

mkdir -p ~/.config/zsh
ln -sfv ~/dotfiles/macos/.config/zsh/.zshrc ~/.config/zsh/.zshrc

mkdir -p ~/.config/git
ln -sfv ~/dotfiles/macos/.config/git/config ~/.config/git/config

mkdir -p ~/.config/nvim/lua
ln -sfv ~/dotfiles/macos/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -sfv ~/dotfiles/macos/.config/nvim/lua/dk ~/.config/nvim/lua
