filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'

" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()

" Autoformatting (github.com/google/vim-codefmt)
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number
set nowrap

" Highlight search items
set hlsearch

" Fix (auto-)indentation
set shiftwidth=2
set tabstop=2
set softtabstop=2

" be iMproved, required (disable vi)
set nocompatible              

" enable syntax and plugins (for netrw)
syntax on
filetype plugin on 

" Taken from https://www.youtube.com/watch?v=XA2WjJbmmoM&t=381s 
" Title: How to Do 90% of What Plugins Do (With Just Vim)

" FINDING FILES: ~
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" THINGS TO CONSIDER: 
" - :b lets you autocomplete any open buffer
" - :ls lets you list the files open in active buffer

" TAG JUMPING: ~
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under curson
" - Use g^] for ambiguos tags
" - Use ^t to jump back up the tag stack
" THINGS TO CONSIDER:
" This doesn't help if you want a visual list of tags

" AUTOCOMPLETE: ~
" The good stuff is documented in |ins-completon|
" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" FILE BROWSING: ~
" Tweaks for browsing
let g:netrw_banner=0					" disable annoying banner
let g:netrw_browse_split=4		" open in prior window
let g:netrw_altv=1						" open splits to the right
let g:netrw_liststyle=3				" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" Show commands entered
set showcmd

" Map system clipboard to yank
nnoremap yy "+yy
vnoremap y "+y

nnoremap p "+p
vnoremap p "+p
nnoremap P "+P
vnoremap P "+P

nnoremap dd "+dd
vnoremap d "+d

set clipboard+=unnamed

