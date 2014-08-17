set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!  
Bundle 'gmarik/vundle'

Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'pangloss/vim-javascript'
Bundle 'mattn/emmet-vim'
Bundle 'skammer/vim-css-color'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tlib_vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'sjbach/lusty'
Bundle 'vim-scripts/argtextobj.vim'
Bundle 'vim-scripts/local_vimrc.vim'
Bundle 'sudo.vim'
Bundle 'tpope/vim-repeat'
Bundle 'kshenoy/vim-signature'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'kien/ctrlp.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'marijnh/tern_for_vim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'ervandew/supertab'
Bundle 'rking/ag.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'beloglazov/vim-textobj-quotes'
Bundle 'mxw/vim-jsx'
Bundle 'bling/vim-airline'

"-----------------------------------------------------------------------------

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
set wildmode=longest,list:longest

"enables a menu at the bottom of the vim/gvim window.
set wildmenu

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

"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" vim ui
"'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

"Informative status line
"set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
"set laststatus=2 " always show the status line. 1 = for > 1 window, 0 = never.

if has('statusline')
	set laststatus=2

	" Broken down into easily includeable segments
	set statusline=%<%f\   " Filename
	set statusline+=%w%h%m%r " Options
	set statusline+=%{fugitive#statusline()} "  Git Hotness
	set statusline+=\ [%{&ff}/%Y]            " filetype
	"set statusline+=\ [%{getcwd()}]          " current dir
	"set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

"Set color scheme
syntax enable
" set background=light
set background=dark
" set t_Co=16
set t_Co=256
" let g:solarized_termcolors=16
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
"map <F8> :TagbarToggle<cr>
"let g:tagbar_left = 1

" Toggle TabMan for feature-rich tab management
"map <F7> :TMToggle<cr>

" Loop through open tabs using F6 and Shift + F6.
map <F6> :tabn<cr>
map <S-F6> :tabp<cr>

" Function: Open tag under cursor in new tab
" Source:   http://stackoverflow.com/questions/908269/opening-ctags-in-new-tab-in-gvim/908316#908316
" map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Open tag in new tab.
" http://stackoverflow.com/questions/539231/how-to-use-multiple-tabs-when-tagging-to-a-function-in-vim/539363#539363
nmap <C-\> <C-w><C-]><C-w>T

" Testing Ctrl-s for saving in insert mode
" in the bash shell you might need to disable flow control. Use this command:
" bash$ stty -ixon -ixoff
:imap <C-s> <Esc>:w<cr>

" Map Ctrl-/ on Dvorak to Esc.
" Mimics the QUERTY Ctrl-]
:imap <C-_> <Esc>

" Highlight .less filetypes as if they are css.
" au BufNewFile,BufRead *.less set filetype=less

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

map <leader>tc :call ToggleFoldColumns()<CR>

let g:indent_on = 0

" Add mootools snippets to javascript files.
"autocmd FileType javascript set ft=javascript.mootools

" Map the session commands for more granular control
nmap SSZ :wa<CR>:mksession! ~/Dropbox/Documents/vim/sessions/
nmap SZ :wa<CR>:so ~/Dropbox/Documents/vim/sessions/
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
"nnoremap <F5> :GundoToggle<CR>

" Run `gjslint` on javascript files using `:make`
" from https://gist.github.com/725689
"au BufNewFile,BufRead *.js set makeprg=gjslint\ %
"au BufNewFile,BufRead *.js set errorformat=%-P-----\ FILE\ \ :\ \ %f\ -----,Line\ %l\\,\ E:%n:\ %m,%-Q,%-GFound\ %s,%-GSome\ %s,%-Gfixjsstyle%s,%-Gscript\ can\ %s,%-G

" Enable the auto-complete plugin at startup
" Now vim will auto-popup the autocomplete list as-you-type
"let g:neocomplcache_enable_at_startup = 1

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
" autocmd BufWritePost *.less exe '!lessc ' . shellescape(expand('<afile>')) . ' > ' . shellescape(expand('<afile>:r') . '.css')

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

" Paste default register over current selection, deleting the selected text to black-hole register
" http://stackoverflow.com/questions/7747426/can-vim-replace-a-text-object-with-the-default-register/7749767#7749767
" Given text in the default register, use it like this to paste into a set of parens:
" vi(,p
vnoremap <Leader>p "_dP

" Store swap files in a common location, not as sidecar files
set directory=~/.vimswap,/tmp
set backupdir=~/.vimbackup,/tmp

set noswapfile
set nobackup

" Disable those temp files
set nobackup
set nowritebackup

set wildignore+=*.o,*.obj,.git,*yii-*,*.jpg,*.gif,*.png,*.jpeg,yii
" Reload all snippets using snipmate function.
" http://code.google.com/p/snipmate/issues/detail?id=67#c6
nmap ,rr :call ReloadAllSnippets()<CR>

" http://stackoverflow.com/a/563992/123781
" Navigating with tags
" Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Open the definition in a vertical split
" Does not work on gnome terminal because Alt does not work.
" map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Recomended by LustyExplorer
set hidden

" Markdown preview
imap <leader>md <ESC>:w!<CR>:!markdown % < %.html && open %.html<CR><CR>a
map  <leader>md <ESC>:w!<CR>:!markdown % < %.html && open %.html<CR><CR>a

" http://www.userobsessed.net/tips-and-tricks/2011/05/10/copy-and-paste-in-vim/
" Fix vim pasting in Insert mode. Paste using ,v in insert mode.
imap <Leader>v  <C-O>:set paste<CR><C-r>*<C-O>:set nopaste<CR>

" gv selects previously visually selected text.
" this adds gp to select the last pasted text
" http://vim.wikia.com/wiki/Selecting_your_pasted_text
" nnoremap gp `[v`]
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Set the filename for all local vimrc files.
" These will be auto-loaded after the main vimrc
" thanks to the local_vimrc plugin
let g:local_vimrc = ".vimrc.local"

" Prefix the name of each tab with a number, e.g.
" 1) vimrc 2) test.js  
" http://vim.wikia.com/wiki/Show_tab_number_in_your_tab_line
if exists("+showtabline")
     function! MyTabLine()
         let s = ''
         let t = tabpagenr()
         let i = 1
         while i <= tabpagenr('$')
             let buflist = tabpagebuflist(i)
             let winnr = tabpagewinnr(i)
             let s .= '%' . i . 'T'
             let s .= (i == t ? '%1*' : '%2*')
             let s .= ' '
             let s .= i . ')'
             let s .= ' %*'
             let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
             let file = bufname(buflist[winnr - 1])
             let file = fnamemodify(file, ':p:t')
             if file == ''
                 let file = '[No Name]'
             endif
             let s .= file
             let i = i + 1
         endwhile
         let s .= '%T%#TabLineFill#%='
         let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
         return s
     endfunction
     set stal=2
     set tabline=%!MyTabLine()
endif

" Objective C (objc)
"au BufNewFile,BufRead *.m,*.h set ft=objc

" List methods courtesy of cocoa plugin
"map <leader>ll :ListMethods<CR>

"let tlist_objc_settings = 'ObjectiveC;P:protocols;i:interfaces;types(...)'
"let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
"let g:clang_user_options='-fblocks -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator6.0.sdk - D__IPHONE_OS_VERSION_MIN_REQUIRED=50000' 

" Tags
" Set vim to use tags
set tags=./tags,tags,./

"let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

set showbreak=↪

let g:ctrlp_root_markers = ['.ctrlp']

" Need to tell terminal it's ansi so the number pad works
"set term=ansi

" -----------------------------------------------------------------------------
" Syntastic
" -----------------------------------------------------------------------------
"
" For JS you will need JSHint installed: npm install -g jshint

" This does what it says on the tin. It will check your file on open too, not
" just on save.
" You might not want this, so just leave it out if you don't.
"let g:syntastic_check_on_open=1

" -----------------------------------------------------------------------------
" YouCompleteMe
" -----------------------------------------------------------------------------

" These are the tweaks I apply to YCM's config, you don't need them but they  might help.
" YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
" From this suggestion:
" http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_confirm_extra_conf=0
"set completeopt-=preview

" Enable Powerline
set rtp+=~/Source/system/powerline/powerline/bindings/vim

" ack support
" " ==> :help ack
let g:ackprg = 'ag --nogroup --nocolor --column --follow'

" unite for file/buffer/kitchen-sink search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" Enable Handlebars abbreviations
let g:mustache_abbreviations = 1

" Airline
let g:airline_powerline_fonts = 1
set laststatus=2
