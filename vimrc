language en_US
if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
else
    let s:editor_root=expand("~/.vim")
    set ttymouse=xterm2
endif

"""" Vundle config"""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
let &rtp = &rtp . ',' . s:editor_root . '/bundle/Vundle.vim'
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" general plugins
Plugin 'Raimondi/delimitMate' " general syntax autocompletion
Plugin 'scrooloose/nerdtree' "File tree
Plugin 'Xuyuanp/nerdtree-git-plugin' "Marks files as changed in NERDTree
Plugin 'airblade/vim-gitgutter' "Marks lines as changed inside buffers
Plugin 'tpope/vim-fugitive' "Git wrapper inside of vim
Plugin 'scrooloose/syntastic' "General linting
Plugin 'mtscout6/syntastic-local-eslint.vim' "Syntastic support for ESLint
Plugin 'mhartington/oceanic-next' "Color theme
Plugin 'ctrlpvim/ctrlp.vim' "Fuzzy file and buffer finder
Plugin 'vim-airline/vim-airline' "Status line configuration
Plugin 'vim-airline/vim-airline-themes' "Airline plugin to support themes in status line
Plugin 'Shougo/deoplete.nvim' "Autocompletion tool
Plugin 'Shougo/echodoc.vim' "Autocompletion preview is shown in command line
Plugin 'nathanaelkane/vim-indent-guides' "Indent guides, shows spaces or tabs

" editorconfig
Plugin 'editorconfig/editorconfig-vim' "Formats buffers depending on .editorconfig

" js plugins
Plugin 'pangloss/vim-javascript' "js syntax highlighting
Plugin 'moll/vim-node' "node.js navigation tool
Plugin 'maksimr/vim-jsbeautify' "js formatting tool, uses .editorconfig
Plugin 'mxw/vim-jsx' "jsx syntax highlighting and indenting
Plugin 'flowtype/vim-flow' "Checks flow errors on save

" python plugins
Plugin 'hdima/python-syntax' "python syntax highlighting

" golang plugins
Plugin 'fatih/vim-go' "Go tool wrapper
Plugin 'jodosha/vim-godebug' "Go debugger
Plugin 'zchee/deoplete-go' "Go autocompletion using gocode

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
set cmdheight=2
set completeopt-=preview

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

" go-vim
let g:go_fmt_command = "goimports"

" airline (tabline)
let g:airline_section_b='%{fugitive#statusline()}'

" deoplete
let g:deoplete#enable_at_startup = 1
" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
" echodoc
let g:echodoc#enable_at_startup = 1
