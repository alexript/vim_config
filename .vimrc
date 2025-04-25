if has('unix')
	language messages C
	set shell=/usr/bin/bash
else
	language English_United States
endif
set nocompatible
execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set ruler
set ignorecase
set hlsearch
set incsearch
set autoindent

if has("gui_running")
"colorscheme desert
" https://github.com/jonathanfilip/vim-lucius
colorscheme lucius
else
"colorscheme catppuccin_macchiato 
colorscheme desert
endif

set guioptions-=T
set fileformats=unix,dos
set encoding=utf-8
set guifont=InconsolataCyr:h16
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  if has('unix')
    set lines=54 columns=200
  else
    set lines=999 columns=999
  endif
endif

if has("gui_running")
  if has("gui_gtk2")
      set guifont=InconsolataCyr\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

let mapleader = " "

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>

nmap <F8> :TagbarToggle<CR>

let g:license_author = "Alex 'Ript' Malyshev"
let g:license_email = 'alexript@gmail.com'

" Commenting blocks of code. Now you can type ,cc to comment a line and ,cu to uncomment a line (works both in normal and visual mode).
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab,cmake       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType dosbatch          let b:comment_leader = 'rem '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Alt-right/left to navigate forward/backward in the tags stack
map <M-Left> <C-T>
map <M-Right> <C-]>

" vim-go
let g:go_version_warning = 0

" https://github.com/inkarkat/vim-mark
let g:mwDefaultHighlightingPalette = 'maximum'
let g:mwAutoLoadMarks = 1
nmap <Leader>N <Plug>MarkAllClear

" https://github.com/xolox/vim-easytags
:let g:easytags_always_enabled = 1
:let g:easytags_auto_highlight = 1

" https://github.com/inkarkat/vim-AutoAdapt
let g:AutoAdapt_FilePattern = '*.h,*.c,*.cpp,*.go,*.md'

" https://github.com/pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

:hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
:hi TabLine ctermfg=Black ctermbg=Green
:hi TabLineSel ctermfg=Black ctermbg=DarkCyan
:hi Title ctermfg=Black ctermbg=DarkBlue

nmap <F9> :bprevious<CR>
nmap <F10> :bnext<CR>
nmap <F11> :bd<CR>

