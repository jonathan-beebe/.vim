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
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" Tags
" http://stackoverflow.com/questions/1790623/how-can-i-make-vims-taglist-plugin-show-useful-information-for-javascript
let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function'

" Add MooTools snippets
" autocmd FileType javascript set ft=javascript.mootools

" Override the indent settings for jsbeautify
let g:Jsbeautify_jslint_expandtab = 1

" Remove all trailing whitespace
" http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim/1618401#1618401
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre *.js :call <SID>StripTrailingWhitespaces()

" Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99
