" vimrc
" Author: wgx731 <wgx731@gmail.com>
" Source: https://github.com/wgx731/vimified
"
" Credit: Zaiste! <oh@zaiste.net>
" 
" wgx731's vimified vimrc file
"

" Load external configuration before anything else {{{
if filereadable(expand("~/.vim/before.vimrc"))
    source ~/.vim/before.vimrc
endif
" }}}

let mapleader = ","
let maplocalleader = "\\"

" Local vimrc configuration {{{
let s:localrc = expand($HOME . '/.vim/local.vimrc')
if filereadable(s:localrc)
    exec ':so ' . s:localrc
endif
" }}}

" PACKAGE LIST {{{
" Use this variable inside your local configuration to declare 
" which package you would like to include
if ! exists('g:vimified_packages')
    let g:vimified_packages = ['general']
endif
" }}}

" VUNDLE {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
" }}}

" PACKAGES {{{

" _. General {{{
if count(g:vimified_packages, 'general')

    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-speeddating'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-unimpaired'
    
    Bundle 'scrooloose/nerdtree' 
    nmap <C-u> :NERDTreeToggle<CR>
    " Disable the scrollbars (NERDTree)
    set guioptions-=r
    set guioptions-=L

    Bundle 'vim-scripts/taglist.vim'
    
    Bundle 'majutsushi/tagbar' 
    nmap <leader>t :TagbarToggle<CR>

    Bundle 'scrooloose/nerdcommenter' 
    nmap <leader># :call NERDComment(0, "invert")<cr>
    vmap <leader># :call NERDComment(0, "invert")<cr>

    Bundle 'sjl/splice.vim'

    Bundle 'scrooloose/syntastic'
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=1

    Bundle 'editorconfig/editorconfig-vim'
    Bundle 'derekwyatt/vim-scala'
    
endif
" }}}

" _. Fancy {{{
if count(g:vimified_packages, 'fancy')
    Bundle 'bling/vim-airline'
    set t_Co=256
endif
" }}}

" _. Ruby {{{
if count(g:vimified_packages, 'ruby')

    Bundle 'tpope/vim-endwise'
    Bundle 'tpope/vim-rails'

endif
" }}}

" _. Python {{{
if count(g:vimified_packages, 'python')

    Bundle 'vim-scripts/indentpython.vim' 

endif
" }}}

" _. HTML {{{
if count(g:vimified_packages, 'html')

    Bundle 'othree/html5.vim'
    Bundle 'tpope/vim-markdown'

    " --
    let g:html5_event_handler_attributes_complete = 0
    let g:html5_rdfa_attributes_complete = 0
    let g:html5_microdata_attributes_complete = 0
    let g:html5_aria_attributes_complete = 0

endif
" }}}

" _. CSS {{{
if count(g:vimified_packages, 'css')
    Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
    Bundle 'groenewege/vim-less'

endif
" }}}

" _. JS {{{
if count(g:vimified_packages, 'js')

    Bundle 'pangloss/vim-javascript'
    Bundle 'leshill/vim-json'
    Bundle 'itspriddle/vim-jquery'

endif
" }}}

" _. Color {{{
if count(g:vimified_packages, 'color')

    Bundle 'sjl/badwolf'
    Bundle 'tomasr/molokai'

endif
" }}}


" General {{{

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" Basic
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

call pathogen#infect()      " update pathogen to load plugin
call pathogen#helptags()    " enable pathogen for help tags

syntax on                   " syntax highlighting on
filetype on                 " enable file type detection
filetype plugin on          " enable filetype plugin files
filetype plugin indent on   " enable indent file for specific file type

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" Environment
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

set nocompatible            " leave vi-compatibility mode
set encoding=utf-8          " unicode encoding by default
set title                   " show title in terminal
set hidden                  " buffer hidden, not closed, when abandoned
set wrap                    " no wrap lines
set linebreak               " wrap lines at convenient points
set noexrc                  " don't use local version of .(g)vimrc, .exrc

if v:version >= 703
    " undo settings
    set undofile
endif

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" GUI Options
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

if has('gui_running')
    set background=dark
    colorscheme badwolf

    " Font
    " set guifont=Inconsolata:h14
    set guifont=Lucida_Console:h14

    " Disable all toolbars
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R

    " Fullscreen Options
    set fullscreen
    set fuoptions=maxvert,maxhorz
    set transparency=10
else
    if $COLORTERM == 'gnome-terminal'
        set t_Co=256
    endif
    colorscheme badwolf
endif

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" Various Configurations
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

set visualbell                      " supress audio/visual error
set backspace=indent,eol,start      " make backspace more flexible
set number                          " show line numbers
set numberwidth=5                   " until 99999 lines

" Search and Highlight
" -------------------------------------------
set hlsearch                " Highlight search
set incsearch
set showmatch

" Case
" -------------------------------------------
set ignorecase
set smartcase

" Characters display
" -------------------------------------------
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Screen Drawing
" -------------------------------------------
set linespace=0         " don't insert extra pixel lines between rows
set lazyredraw          " don't redraw while running macros
set ttyfast             " fast redraw screen

" Status Indicators
" -------------------------------------------
set showcmd             " show the command being typed
set showmode            " show insert, replace & visual mode indicator
set notimeout           " no command timeout
set laststatus=2        " always show the status line
set visualbell          " blink
set report=0            " report this or greater number of changed lines

" statusline setup
set statusline=%f       " tail of the filename

" display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

" display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      " help file flag
set statusline+=%y      " filetype
set statusline+=%r      " read only flag
set statusline+=%m      " modified flag

" Completion
" -------------------------------------------
set wildmode=list:longest
set wildmode=longest:full
set completeopt=longest,menuone,preview

" File type specific completion
" -------------------------------------------
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

inoremap <leader>a <C-x><C-o> " key combo to toggle omnicomplete

" Splitting Windows
" -------------------------------------------
set splitright

" Text Formatting and Layout
" -------------------------------------------
set wrap                " soft wrap long lines

" Indentation
" -------------------------------------------
set autoindent      " copy indent form current when starting a new line

" Tabs
" -------------------------------------------
set expandtab       " convert tabs into spaces
set tabstop=4
set softtabstop=4   " tab conversion to number of spaces
set shiftwidth=4    " auto-indent amount
set shiftround      " when at 3 spaces, when I hit > .. go to 4, not 5
set smarttab

" Backup & saving
" -------------------------------------------
set noswapfile
set nobackup
set nowritebackup
set nowb

set autowriteall
set autoread
"autocmd FocusLost * silent! wall


" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" Keybindings
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

" Shortcut to clear highlighted search
" -------------------------------------------
"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
cnoremap <C-L> <C-O>:nohls<CR>

" Leader Keys
" -------------------------------------------
let mapleader = ","
let maplocalleader = ";"

" Stop using the arrow keys
" -------------------------------------------
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

" kj - Get out of insert mode
" -------------------------------------------
imap kj     <Esc>

" Make Y consistent with D and C
" -------------------------------------------
map Y           y$

" Indent/unindent visual mode selection
" -------------------------------------------
vmap <tab>      >gv
vmap <S-tab>    <gv

" Search
" -------------------------------------------
nmap <leader>s  :%s/
vmap <leader>s  :s/

" Split screen
" -------------------------------------------
map <leader>v   :vsp<CR>

" Move between split screens
" -------------------------------------------
map <leader>w   ^Ww
map <leader>=   ^W=
map <leader>j   ^Wj
map <leader>k   ^Wk
nmap <C-j>      <C-w>j
nmap <C-k>      <C-w>k
nmap <C-h>      <C-w>h
nmap <C-l>      <C-w>l

" Auto-indent whole file
" -------------------------------------------
nmap <leader>=  gg=G``
map <silent> <F7> gg=G``    :delmarks z<CR>:echo "Reformatted."<CR>

" Fast scrolling
" -------------------------------------------
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>

" Easy access to the shell
" -------------------------------------------
map <Leader><Leader> :!

" Insert a blank link without leaving insert mode
" -------------------------------------------
:nnoremap <silent> <leader>k :pu! _<cr>:']+1<cr>   " on top
:nnoremap <silent> <leader>j :pu _<cr>:'[-1<cr>    " at the bottom

" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" Helpers
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

" Swapping Split Screens
" -------------------------------------------

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

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>


" Make sure Vim returns to the same line when you reopen a file
" -------------------------------------------------------------
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   execute 'normal! g`"zvzz"' |
                \ endif
augroup END

" Highlighting
" ------------------------------------------------------------------

" Syntax
" Show syntax highlighting groups for word under cursor
" ------------------------------------------------------------------

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nmap <C-g> :call <SID>SynStack()<CR>

" Toggle Indicators
" -------------------------------------------------------------
" We'll use &number and &relativenumber (mutually eclusive) as proxies for 
" the toggle state of all our preferred indicator UI
function! ToggleIndicators()
    if (&number || &relativenumber) " turn off indicators
        let b:IndicatorNumber = 0
        let b:IndicatorRelativeNumber = 0
        let b:IndicatorCursorColumn = 0
        let b:IndicatorCursorLine = 0
        let b:IndicatorColorColumn = 0
        let b:IndicatorLastStatus = 0
        if &number
            let b:IndicatorNumber = 1
            set nonumber
        else " must be relativenumber
            let b:IndicatorRelativeNumber = 1
            set norelativenumber
        endif
        if &cursorcolumn==1
            let b:IndicatorCursorColumn = 1
            set nocursorcolumn
        endif
        if &cursorline
            let b:IndicatorCursorLine = 1
            set nocursorline
        endif
        if &colorcolumn > 0
            let b:IndicatorColorColumn = &colorcolumn
            set colorcolumn=0
        endif
        if &laststatus > 0
            let b:IndicatorLastStatus = &laststatus
            set laststatus=0
        endif
    else                            " turn on indicators
        if b:IndicatorNumber
            set number
        else " must be relativenumber
            set relativenumber
        endif
        if b:IndicatorCursorColumn
            set cursorcolumn
        endif
        if b:IndicatorCursorLine
            set cursorline
        endif
        if b:IndicatorColorColumn > 0
            exe "set colorcolumn=" . b:IndicatorColorColumn
        endif
        if b:IndicatorLastStatus > 0
            exe "set laststatus=" . b:IndicatorLastStatus
        endif
    endif
endfunction

nnoremap <F3> :call ToggleIndicators()<CR>
inoremap <F3> <ESC>:call ToggleIndicators()<CR>a
vnoremap <F3> <ESC>:call ToggleIndicators()<CR>

" Toggle CursorColumn 
" -------------------------------------------------------------
nnoremap <F4> :set invcursorcolumn<CR>
inoremap <F4> <ESC>:set invcursorcolumn<CR>a
vnoremap <F4> <ESC>:set invcursorcolumn<CR>

" NERDCommenter
" ------------------------------
map <leader>/   <plug>NERDCommenterToggle
" }}}

" Load addidional configuration (ie to overwrite shorcuts) {{{
if filereadable(expand("~/.vim/after.vimrc"))
    source ~/.vim/after.vimrc
endif
" }}}
