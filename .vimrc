" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier
"

execute pathogen#infect()

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" enable incremental search
set incsearch
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
"set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
filetype plugin on
" colorscheme inspiration642895
set ofu=syntaxcomplete#Complete

" turn line numbers on
" set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
set hidden
set autowrite
set hlsearch
"set cursorline
set backspace=indent,eol,start
"set autochdir
"autocmd BufEnter * lcd %:p:h
"set makeprg=scons
au BufNewFile,BufRead scons.* set filetype=python
au BufRead,BufNewFile *.hcpp set filetype=cpp

" Remove trailing whitespaces on save
autocmd BufWritePre *.[hc]pp :%s/\s\+$//e

" C++17 highlighter settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error = 1

map <F9> :make\|cw<CR>
map <F5> :!run_here<CR>
map <F7> :bn<CR>
map <C-F7> :bp<CR>

set <M-r>=r

" Enhanced keyboard mappings
"
map <F12> :NERDTreeToggle<CR>
map <F7> :NERDTreeFind<CR>
map <F10> :TlistToggle<CR>
noremap <silent> <C-]> :FufTagWithCursorWord!<CR>

map <C-P> :CtrlP
map <C-B> :CtrlPBuffer<CR>

set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]
set laststatus=2 

set path=src/main,src/libs

let g:ycm_enable_diagnostic_signs = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
