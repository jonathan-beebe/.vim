Jon Beebe's .vim
================

Installation
------------

Change to the desired directory.

	cd /home/beebe/Source/

Clone the repo.

	git clone git@github.com:somethingkindawierd/.vim.git vim
	./init.sh

To update an existing installation:

        # pull changes from master
        git pull origin master
        ./init.sh

Link the `vim` folder and `vimrc` to correct location.

	ln -s /home/beebe/Source/vim /home/beebe/.vim
	ln -s /home/beebe/Source/vim/vimrc /home/beebe/.vimrc

Enjoy.

More Information
----------------

For more VIM goodness, check out [Jon Beebe's VIM Tips wiki](https://github.com/somethingkindawierd/somethingkindawierd.github.com/wiki/VIM-Tips).
It comes complete with compilation/installation instructions, as well as advanced `ctags` use for `php` and `javascript`.


