" Enable pathogen plugin autoloader
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" map the leader to a more suitable character
let mapleader = ","

"Map NERDTree to ,p
nmap <silent> <Leader>p :NERDTreeToggle<CR>

" Copy All to global clipboard
nmap <silent> <Leader>ca gg"+yG
" Copy to global clipboard
" ex: 10,cy -> yank 10 lines to clipboard.
" ex: ma10j,c'a -> # create mark `a`, move 10 lines down, 
"                  # copy from mark `a` to clipboard.
nmap <silent> <Leader>c "+y

" To have the completion behave similarly to a shell, i.e. complete only up to
" the point of ambiguity (while still showing you what your options are),
" also add the following
set wildmode=list:longest

" Render a pretty title in the terminal window
" This gives e.g. | page.html (~) - VIM |.
set title

set nocompatible
set bs=2 "set backspace to be able to delete previous characters
"Enable line numbering, taking up 6 spaces
"set number
"press Ctrl-n Twice to toggle line numbers
:nmap <C-N><C-N> :set invnumber<CR>

" Use relative line numbers
set relativenumber

"Set title of terminal window
set title

"Turn off word wrapping
set wrap!

" Indenting + Whitespace rules.
set tabstop=4 "set tab character to 4 characters
set noexpandtab "do not use spaces for tabs
set shiftwidth=4 "indent width for autoindent

"Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

"Informative status line
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
set laststatus=2 " always show the status line. 1 = for > 1 window, 0 = never.

"Set color scheme
syntax enable
set background=light
" set background=dark
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized

" Highlight searches.
set hlsearch

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

"Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide

"Have 8 lines of offset (or buffer) when scrolling
set scrolloff=8

"set line numbering to take up 5 spaces
set numberwidth=5

"Highlight current line
set cursorline

"Turn on spell checking with English dictionary
"set spell
"Spell check for specific filetypes
autocmd BufNewFile,BufRead *.txt setlocal spell
set spelllang=en
set spellsuggest=9 "show only 9 suggestions for misspelled words

filetype on
filetype plugin on
set ofu=syntaxcomplete#Complete

"Tag List Plugin
"let Tlist_Auto_Open = 1
"let Tlist_Show_One_File = 1
"map <F8> :TlistToggle<cr>
map <F8> :TagbarToggle<cr>
let g:tagbar_left = 1

" Loop through open tabs using F6 and Shift + F6.
map <F6> :tabn<cr>
map <S-F6> :tabp<cr>

" Testing Ctrl-s for saving in insert mode
" in the bash shell you might need to disable flow control. Use this command:
" bash$ stty -ixon -ixoff
:imap <C-s> <Esc>:w<cr>

" Map Ctrl-/ on Dvorak to Esc.
" Mimics the QUERTY Ctrl-]
:imap <C-_> <Esc>

" Highlight .less filetypes as if they are css.
au BufNewFile,BufRead *.less set filetype=less

" Persistent Undo for VIM 7.3
set undofile
set undodir=/tmp

" make sure that max lines are displayed
" (80 and 120 are from ZF Coding standards)
set colorcolumn=80,120

" Wrap cursor at beginning/end of lines
set whichwrap+=<,>,h,l,[,]

" Auto-enter the beginning of a comment block when editing within comment
set comments=sl:/*,mb:\ *,elx:*/
set formatoptions+=r

" Enable mouse integration into the windows.
" You will be able to click to select the active window
" and selecting text will not select across all windows
" but only in the active window.
"set mouse=a
" EDIT: I have since installed the vim-togglemouse plugin, toggle with <F12>

" highlight tabs and trailing spaces
" set listchars=tab:›-,trail:-
set listchars=tab:▸\ ,trail:.,extends:#,nbsp:.,eol:¬
" View whitespace using `set list` in session.

" toggle fold columns
" call like this:
" :call ToggleFoldColumns()
function! ToggleFoldColumns()
     if g:indent_on == 1
         :set nocindent noai
         let g:indent_on = 0
         set foldcolumn=0
     else
         :set cindent ai
         let g:indent_on = 1
         set foldcolumn=5
     endif
endfunction

let g:indent_on = 0

" Add mootools snippets to javascript files.
autocmd FileType javascript set ft=javascript.mootools

" Map the session commands for more granular control
nmap SSZ :wa<CR>:mksession! ~/Dropbox/ubuntu/vim/sessions/
nmap SZ :wa<CR>:so ~/Dropbox/ubuntu/vim/sessions/
" Specifically remove help and options from default session list
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize

" This unsets the 'last search pattern' register by hitting return
nmap <silent> <leader>/ :nohlsearch<CR>

" Allow for a ; + w to work the same as <SHIFT + ;> + w
nmap ;w :w<CR>
" An accidental <SHIFT + ;> + <SHIFT + w> will still write file.
nmap :W :w<CR>

" Allow for accidental :+Q to quit.
nmap :Q :q<CR>

" Toggle visibility of the undo tree via the Gundo plugin
nnoremap <F5> :GundoToggle<CR>

" Store swap files in a common location, not as sidecar files
set directory=~/.vimswap,/tmp
set backupdir=~/.vimbackup,/tmp

" Run `gjslint` on javascript files using `:make`
" from https://gist.github.com/725689
au BufNewFile,BufRead *.js set makeprg=gjslint\ %
au BufNewFile,BufRead *.js set errorformat=%-P-----\ FILE\ \ :\ \ %f\ -----,Line\ %l\\,\ E:%n:\ %m,%-Q,%-GFound\ %s,%-GSome\ %s,%-Gfixjsstyle%s,%-Gscript\ can\ %s,%-G

" Enable the auto-complete plugin at startup
" Now vim will auto-popup the autocomplete list as-you-type
let g:neocomplcache_enable_at_startup = 1

" Window Swapping, from:
" http://stackoverflow.com/questions/2586984/how-can-i-swap-positions-of-two-open-files-in-splits-in-vim/4903681#4903681
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

noremap <silent> <leader>mw :call MarkWindowSwap()<CR>
noremap <silent> <leader>pw :call DoWindowSwap()<CR>

" Save the full path of all open buffers to a text file in the current dir.
" http://stackoverflow.com/questions/7236315/how-can-i-view-the-filepaths-to-all-vims-open-buffers
noremap <silent> <leader>so :call writefile( map(filter(range(0,bufnr('$')), 'buflisted(v:val)'), 'fnamemodify(bufname(v:val), ":p")'), 'open_buffers.txt' )<CR>

" Disable that pesky `ex mode`
" http://stackoverflow.com/questions/1269689/to-disable-entering-ex-mode-in-vim
map Q <Nop>

" Auto-compile a style.less file into style.css
" http://forrst.com/posts/Make_vim_compile_less_css_files_on_save-D0v
autocmd BufWritePost *.less exe '!lessc ' . shellescape(expand('<afile>')) . ' ' . shellescape(expand('<afile>:r')) . '.css'

" Toggle the "paste mode"
set pastetoggle=<F2>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Vim Text Bubbling, from:
" http://vimcasts.org/episodes/bubbling-text/
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv