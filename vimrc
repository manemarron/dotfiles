"""" Vundle config"""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" general plugins
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mhartington/oceanic-next'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'

" editorconfig
Plugin 'editorconfig/editorconfig-vim'

" js plugins
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'moll/vim-node'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mxw/vim-jsx'
Plugin 'flowtype/vim-flow'

" python plugins
Plugin 'hdima/python-syntax'

" golang plugins
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"""" end: Vundleconfig""""

set fixendofline

" Theme
syntax enable
if (has("termguicolors"))
 set termguicolors
endif
colorscheme OceanicNext

set number
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set foldmethod=syntax
set autoindent
set cindent
set nocompatible

" for css or scss
" Remap arrow keys to NOP
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Remap CTRL-N to line splitting
imap <C-n> <CR><Esc>O<Tab>

" Syntastic config
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_go_checkers = ['golint', 'go vet']

" General conceal settings. Will keep things concealed
" even when your cursor is on top of them.
set conceallevel=1
set concealcursor=nvic
 
" vim-javascript conceal settings.
let g:javascript_conceal_function = "λ"
let g:javascript_conceal_this = "@"
let g:javascript_conceal_return = "<"
let g:javascript_conceal_prototype = "#"

" flow
let g:flow#enable = 1
let g:flow#flowpath = "flow"

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/node_modules/*,*/.git/*,*.swp

" NERDtree
let NERDTreeShowHidden=1

" JSBeautify
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" JSX
let g:jsx_ext_required = 0

:set list
:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" go
let g:go_fmt_command = "goimports"
