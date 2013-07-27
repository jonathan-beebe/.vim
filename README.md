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

To update an existing installation:

        # pull changes from master
        git pull origin master
        
        # update all bundled plugins from their master branches.
        # the normal `git submodule update` does not work for this purpose.
        git submodule foreach 'git pull origin master'

Having problems with submodules? Need to remove one? [Check out this SO answer](http://stackoverflow.com/a/1260982/123781)

1. Delete the relevant section from the `.gitmodules` file.
2. Stage the `.gitmodules` changes `git add .gitmodules`
3. Delete the relevant section from `.git/config`.
4. Run `git rm --cached path_to_submodule` (no trailing slash).
5. Run `rm -rf .git/modules/submodule_name`
6. Commit
7. Delete the now untracked submodule files `rm -rf path_to_submodule`

Link the `vim` folder and `vimrc` to correct location.

	ln -s /home/beebe/Source/vim /home/beebe/.vim
	ln -s /home/beebe/Source/vim/vimrc /home/beebe/.vimrc

Enjoy.

More Information
----------------

For more VIM goodness, check out [Jon Beebe's VIM Tips wiki](https://github.com/somethingkindawierd/somethingkindawierd.github.com/wiki/VIM-Tips).
It comes complete with compilation/installation instructions, as well as advanced `ctags` use for `php` and `javascript`.


