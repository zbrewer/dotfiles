#!/bin/zsh
#This script will make links for all of the dotfiles that are in the dotfiles git repo
#For use on laptops

ln -s bashrc $HOME/.bashrc
ln -s conkyrc_laptop $HOME/.conkyrc
ln -s ctags $HOME/.ctags
ln -s i3_laptop $HOME/.i3
ln -s vim $HOME/.vim
ln -s vimrc $HOME/.vimrc
ln -s xinitrc $HOME/.xinitrc
ln -s Xresources $HOME/.Xresources
ln -s zshrc $HOME/.zshrc
