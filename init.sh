#!/bin/bash
git clone https://github.com/gmarik/Vundle.vim.git bundle/Vundle.vim
vim +PluginInstall +qall
cd bundle/vimproc.vim/; make;
cd ../tern_for_vim; npm install;

