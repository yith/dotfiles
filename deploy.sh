#!/usr/bin/env zsh

# copy templates for local setting files to home directory
ln -s local/* ~

# symlink vimperator plugins
mkdir -p ~/.vimperator/plugin
ln -s ~/dotfiles/vimperator-plugins/{caret-hint,googleselect,copy}.js ~/.vimperator/plugin

# symlink .vim
ln -s ~/dotfiles/.vim ~
