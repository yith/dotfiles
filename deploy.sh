#!/usr/bin/env zsh

# copy templates for local setting files to home directory
ln -s local/* ~

# symlink vimperator plugins
mkdir -p ~/.vimperator/plugin
ln -s ~/dotfiles/vimperator-plugins/{caret-hint,googleselect,copy,multi_requester}.js ~/.vimperator/plugin

# symlink .vim
ln -s ~/dotfiles/.vim ~

# install enhancd
curl -L git.io/enhancd | sh

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git
