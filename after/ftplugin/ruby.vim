" Indent rules
" more here: http://vimdoc.sourceforge.net/htmldoc/indent.html
" http://blogs.gnome.org/johannes/2006/11/10/getting-cool-auto-indent-in-vim/
setlocal smartindent " is like 'autoindent' but also recognizes some C syntax to
                     " increase/reduce the indent where appropriate.
setlocal tabstop=2 " set tab character to 2 characters
setlocal expandtab " turn tabs into whitespace

" retab         " cause all existing tabs to be rendered as spaces

setlocal shiftwidth=2 "indent width for autoindent

"Tab Stops for languages
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
