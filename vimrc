" language en_US

"""" Editor root config"""""
if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
else
    let s:editor_root=expand("~/.vim")
    set ttymouse=xterm2
endif
"""" end: Editor root config"""""

"""" plug config"""""
call plug#begin(s:editor_root . '/plugged')

" general plugins
Plug 'Raimondi/delimitMate' " general syntax autocompletion
Plug 'airblade/vim-gitgutter' "Marks lines as changed inside buffers
Plug 'tpope/vim-fugitive' "Git wrapper inside of vim
Plug 'vim-syntastic/syntastic' "General linting
Plug 'mtscout6/syntastic-local-eslint.vim' "Syntastic support for ESLint
Plug 'danilo-augusto/vim-afterglow' "Color scheme
Plug 'ctrlpvim/ctrlp.vim' "Fuzzy file and buffer finder
Plug 'vim-airline/vim-airline' "Status line configuration
Plug 'vim-airline/vim-airline-themes' "Airline plugin to support themes in status line
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "Autocompletion tool
Plug 'Shougo/echodoc.vim' "Autocompletion preview is shown in command line
Plug 'nathanaelkane/vim-indent-guides' "Indent guides, shows spaces or tabs

" markdown
Plug 'iamcco/markdown-preview.nvim'

" editorconfig
Plug 'editorconfig/editorconfig-vim' "Formats buffers depending on .editorconfig

" js plugins
Plug 'pangloss/vim-javascript' "js syntax highlighting
Plug 'moll/vim-node' "node.js navigation tool
Plug 'maksimr/vim-jsbeautify' "js formatting tool, uses .editorconfig
Plug 'mxw/vim-jsx' "jsx syntax highlighting and indenting
Plug 'carlitux/deoplete-ternjs' "js autocompletion using tern.js

" python plugins
Plug 'vim-python/python-syntax' "python syntax highlighting
Plug 'tmhedberg/SimpylFold' "python folding for python-syntax
Plug 'deoplete-plugins/deoplete-jedi' "python autocompletion

" handlebars
Plug 'mustache/vim-mustache-handlebars'

" yaml
Plug 'pedrohdz/vim-yaml-folds'

" cloudformation
Plug 'speshak/vim-cfn'

" c#
Plug 'OrangeT/vim-csharp'
Plug 'OmniSharp/omnisharp-vim'
Plug 'puremourning/vimspector'

" All of your Plugins must be added before the following line
call plug#end()
"""" end: plug config""""

filetype indent plugin on

"""" Theme"""""
syntax enable
if (has("termguicolors"))
 set termguicolors
endif
set background=dark
colorscheme afterglow
"""" end: Theme"""""

set number
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set foldmethod=syntax
set autoindent
set cindent
set completeopt=longest,menuone,preview
set previewheight=5
set fixendofline
set swapfile
set dir=~/.local/share/nvim/swap

"""" General mappings"""""
autocmd StdinReadPre * let s:std_in=1
" Map // in visual mode to search for visual selection in current buffer
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <c-space> :noh<bar>:echo<cr>
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
inoremap <C-n> <CR><Esc>O<Tab>
"""" end: General mappings"""""

"""" deoplete""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
"""" end: deoplete""""

"""" syntastic""""
let g:syntastic_check_on_open=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_go_checkers = ['golint', 'go vet', 'golangci-lint']
let g:syntastic_cs_checkers = ['code_checker']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_cloudformation_checkers = ['cfn_lint']
"""" end: syntastic""""

" General conceal settings. Will keep things concealed
" even when your cursor is on top of them.
set conceallevel=1
set concealcursor=nvic

" vim-javascript conceal settings.
let g:javascript_conceal_function = "λ"
let g:javascript_conceal_this = "@"
let g:javascript_conceal_return = "<"
let g:javascript_conceal_prototype = "#"


" ctrlp
set wildignore+=node_modules/**,vendor/**,obj/**,bin/Debug/**,bin/Release/**,dist/**,target/**,.git/**,**/node_modules/**,**/vendor/**,**/obj/**,**/bin/Debug/**,**/bin/Release/**,**/dist/**,**/target/**,**/.git/**,**/build/**
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|vendor|bin|obj|build)|(\.(swp|ico|git|svn))$'

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


"""" echodoc config"""""
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'
"""" end: echodoc config"""""

"""" OmniSharp config"""""
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_net6 = 1
let g:OmniSharp_timeout = 5
let g:OmniSharp_selector_ui = 'ctrlp'
let g:OmniSharp_highlight_types = 2
" Map \+<space> to OmniSharpGetCodeActions in normal mode
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Map F2 to OmniSharpRename with dialog in normal mode
nnoremap <F2> :OmniSharpRename<CR>
" Map \+cf to OmniSharpCodeFormat in normal mode
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
augroup omnisharp_commands
    autocmd!
    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs OmniSharpTypeLookup
    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END
"""" end: OmniSharp config"""""

let g:python3_host_prog = '~/virtualenvs/venv/bin/python3'
