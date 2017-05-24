#!/usr/bin/env bash

configs_dir=$HOME/src/vimconfig

function install_file {
    dir=$1
    fname=$2
    full_fname=$1/$2
    if [ -f $full_fname ]; then
        if [ -L $full_fname ]; then
            echo "removing symlink $full_fname"
            rm $full_fname
        else
            echo "backing up $full_fname"
            mv $full_fname $full_fname.backup
        fi
    fi
    ln -s $configs_dir/$fname $full_fname
}

install_file $HOME .vimrc
install_file $HOME .vim

cd $HOME/.vim/bundle/YouCompleteMe
./install.py --clang-completer
