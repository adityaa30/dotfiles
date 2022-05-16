set nocompatible
filetype off                  " required

" enable fuzzy auto-complete
set rtp+=/opt/homebrew/opt/fzf

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Better display unwanted whitespace.
Plugin 'ntpeters/vim-better-whitespace'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'

" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" enable better syntax highlighting for golang
set runtimepath+=$GOROOT/misc/vim

" enable syntax and plugins
syntax on                    " required
filetype plugin indent on    " required

" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()

" Autoformatting (github.com/google/vim-codefmt)
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType sql AutoFormatBuffer sql-lint
  autocmd FileType python AutoFormatBuffer autopep8
augroup END

Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"
Glaive codefmt clang_format_style="google"


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

" Format paragraph (selected or not) to 80 character lines
set textwidth=80
nnoremap <Leader>g gqap
xnoremap <Leader>g gqa

" Prevent x and the delete key from overriding what's in the clipboard
noremap x "_x
noremap X "_x
noremap <Del> "_x

set clipboard+=unnamed

" Trim whitespaces at EOL on write
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWrite * call TrimWhitespace()

" Make sure all types of requirements.txt files get syntax highlighting
autocmd BufNewFile,BufRead requirements*.txt set ft=python

" Make sure .aliases, .bash_aliases and similar files get syntax highlighting
autocmd BufNewFile,BufRead *aliases set ft=sh
