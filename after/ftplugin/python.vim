" Indent rules
" more here: http://vimdoc.sourceforge.net/htmldoc/indent.html
" http://blogs.gnome.org/johannes/2006/11/10/getting-cool-auto-indent-in-vim/
setlocal smartindent " is like 'autoindent' but also recognizes some C syntax to
                " increase/reduce the indent where appropriate.
setlocal tabstop=4 " set tab character to 2 characters
setlocal expandtab " turn tabs into whitespace

retab         " cause all existing tabs to be rendered as spaces

setlocal shiftwidth=4 "indent width for autoindent

"Tab Stops for languages
autocmd Filetype python setlocal ts=4 sts=4 sw=4
