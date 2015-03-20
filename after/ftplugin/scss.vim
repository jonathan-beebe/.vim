set omnifunc=csscomplete#CompleteCSS
set ofu=syntaxcomplete#Complete

setlocal autoindent " basic -- indents from previous line

" Adjust indentation to use the tab character, 2 characters wide.
setlocal shiftwidth=2
setlocal tabstop=2

" Force the html document to be re-tabbed converting spaces to tabs
" http://osmanov-dev-notes.blogspot.com/2011/04/change-indentation-spaces-to-tabs.html
" setlocal noexpandtab! " do *not* exptand spaces into tabs
" setlocal noet
setlocal expandtab " tabs into whitespace

" cause the document to be re-tabbed, converting spaces to tabs.
" retab!

"Tab Stops for languages
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
