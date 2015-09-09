#!/usr/bin/env zsh

# copy templates for local setting files to home directory
ln -s ~/dotfiles/local/.* ~

# symlink vimperator plugins
mkdir -p ~/.vimperator/plugin
ln -s ~/dotfiles/vimperator-plugins/{caret-hint,googleselect,copy,multi_requester}.js ~/.vimperator/plugin

# symlink .vim
ln -s ~/dotfiles/.vim ~

# install enhancd
curl -L git.io/enhancd | sh
