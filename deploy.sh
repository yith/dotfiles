#!/usr/bin/env zsh

DF_PATH=$HOME/dotfiles

# copy templates for local setting files to home directory
ln -s $DF_PATH/local/.* ~

# symlink vimperator plugins
mkdir -p ~/.vimperator/plugin
ln -s $DF_PATH/vimperator-plugins/{caret-hint,googleselect,copy,multi_requester}.js ~/.vimperator/plugin

# symlink .vim
ln -s $DF_PATH/.vim ~
