#!/usr/bin/env zsh

DF_PATH=$HOME/dotfiles

# copy templates for local setting files to home directory
cp -n $DF_PATH/local/.* ~

# symlink vimperator plugins
mkdir -p ~/.vimperator/plugin
ln -s $DF_PATH/vimperator-plugins/{caret-hint,googleselect,copy,multi_requester}.js ~/.vimperator/plugin

# symlink .vim
ln -s $DF_PATH/.vim ~

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# enhancd
git clone --depth 1 https://github.com/b4b4r07/enhancd.git ~/.enhancd/zsh/enhancd.zsh
