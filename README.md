Jon Beebe's .vim
================

Installation
------------

Change to the desired directory.

	cd /home/beebe/Source/

Clone the repo.

	git clone git@github.com:somethingkindawierd/.vim.git vim
	git submodule init
	git submodule update

Link the `vim` folder and `vimrc` to correct location.

	ln -s /home/beebe/Source/vim /home/beebe/.vim
	ln -s /home/beebe/Source/vim/vimrc /home/beebe/.vimrc

Enjoy.

VIM 7.3
-------

To utilize all the plugins VIM must be compiled with ruby & python support.
Here's how I accomplish this in Ubuntu.

Install dependiencies

	sudo apt-get install mercurial
    sudo apt-get build-dep vim-gnome
    sudo apt-get install libssl-dev python-dev ruby-dev

    hg clone https://vim.googlecode.com/hg/ ~/Source/vim
    cd ~/Source/vim
    ./configure --enable-multibyte --enable-pythoninterp=yes --enable-rubyinterp --enable-xim --enable-gui=gnome2 --with-features=huge --prefix=$HOME
    make
	make install


