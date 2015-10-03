" vim:set foldmethod=marker:

augroup MyAutoCmd
  autocmd!
augroup END

" NeoBundle {{{
set nocompatible
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \   'windows' : 'make -f make_mingw32.mak',
  \   'cygwin'  : 'make -f make_cygwin.mak',
  \   'mac'     : 'make -f make_mac.mak',
  \   'unix'    : 'make -f make_unix.mak',
  \  }}

NeoBundleLazy 'Shougo/unite.vim', {
  \ 'autoload': {
  \   'commands': ['Unite', 'UniteWithBufferDir', 'UniteWithCurrentDir', 'UniteBookmarkAdd'],
  \ }}

NeoBundleLazy 'Shougo/neomru.vim', {
  \ 'autoload': {
  \   'unite_sources': ['file_mru'],
  \ }}

NeoBundle 'Shougo/vimfiler', {
  \ 'depends': ['Shougo/unite.vim'],
  \ }

" appearance
NeoBundle 'mkitt/tabline.vim.git'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tomasr/molokai.git'

" cursor & editting
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-surround'
NeoBundle 'LeafCage/yankround.vim'

" neocomplete
if has('lua') && v:version >= 703
  NeoBundleLazy 'Shougo/neocomplete.vim', { 'autoload': { 'insert': 1 }}
  let s:hooks = neobundle#get_hooks("neocomplete.vim")
  function! s:hooks.on_source(bundle)
    let g:acp_enableAtStartup = 0
    let g:neocomplet#enable_smart_case = 1
    let g:neocomplete#enable_at_startup = 1
  endfunction
endif

" neosnippet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" code navigation
NeoBundleLazy 'majutsushi/tagbar', { 'autoload': { 'commands': ['TagbarToggle'] }}
NeoBundleLazy 'h1mesuke/unite-outline', { 'autoload': { 'unite_sources': ['outline'], }}
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'vim-scripts/errormarker.vim.git'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'

" Python
NeoBundleLazy 'davidhalter/jedi-vim', {
  \ 'autoload': { 'filetypes': ['python', 'python3'] }}

" HTML
NeoBundleLazy 'mattn/emmet-vim', { 'autoload': { 'filetypes': ['html', 'css'] }}

" Haskell
NeoBundleLazy 'kana/vim-filetype-haskell', { 'autoload': { 'filetypes': ['haskell'] }}
"NeoBundleLazy 'eagletmt/ghcmod-vim', { 'autoload': { 'filetypes': ['haskell'] }}
"NeoBundleLazy 'ujihisa/neco-ghc', { 'autoload': { 'filetypes': ['haskell'] }}
"NeoBundleLazy 'ujihisa/ref-hoogle', { 'autoload': { 'filetypes': ['haskell'] }}

" Markdown
NeoBundleLazy 'rcmdnk/vim-markdown', { 'autoload': { 'filetypes': ['markdown'] }}

" binary editor
NeoBundleLazy 'Shougo/vinarise.vim', { 'commands': [ { 'name': 'Vinarise', 'complete': 'file' } ]}

" Julia
NeoBundleLazy 'JuliaLang/julia-vim', {
  \ 'autoload': { 'filetypes': ['julia'] }}


call neobundle#end()

filetype plugin indent on
NeoBundleCheck

" }}}

" Basic settings {{{

" display
set showmatch
set number
set ruler
set cursorline
set showcmd

set timeoutlen=0

" indent
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

" line
set wrap
if exists('+colorcolumn')
  set colorcolumn=80
endif

" disable backup
set nowritebackup
set nobackup
set noswapfile

" search
set smartcase
set ignorecase
set hlsearch
set incsearch

" window
set splitbelow
set splitright

" etc
set hidden
set history=1000
set backspace=indent,eol,start
set modeline
set modelines=5
syntax on

" needed for lightline.vim
set laststatus=2

" colorschehme
set t_Co=256
set background=dark
colorscheme molokai
let g:molokai_original = 1

" encoding
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

" ctags
set tags=tags;

" default to verymagic when searching
nnoremap /  /\v
nnoremap ?  ?\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

" }}}

" Unite.vim {{{
let s:hooks = neobundle#get_hooks('unite.vim')
function! s:hooks.on_source(bundle)
  let g:unite_enable_start_insert = 1
  call unite#custom_default_action('source/bookmark/directory', 'vimfiler')
  call unite#custom_default_action('directory', 'vimfiler')
  call unite#custom_default_action('directory_mru', 'vimfiler')
endfunction

" use ag
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--line-numbers --nogroup --nocolor --ignore ''.git'''
  let g:unite_source_grep_recursive_opt = ''
endif

" key bindings
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nnoremap <silent> <F2> :<C-u>VimFilerBufferDir<CR>
nnoremap <silent> <F3> :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]c :<C-u>UniteWithCurrentDir file_mru file<CR>
nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir file_mru file<CR>
nnoremap <silent> [unite]r :<C-u>Unite register<CR>
nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
nnoremap <silent> [unite]h :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep<CR>
nnoremap <silent> [unite]m :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
" }}}

" vimfiler {{{
let s:hooks = neobundle#get_hooks('vimfiler')
function! s:hooks.on_source(bundle)
  let g:vimfiler_as_default_explorer = 1
  let g:vimfiler_enable_auto_cd = 1
  let g:vimfiler_ignore_pattern = "\%(\.pyc$\)"

  autocmd MyAutoCmd FileType vimfiler call s:vimfiler_settings()
  function! s:vimfiler_settings()
    nmap <buffer> <C-l> <C-w>l
  endfunction
endfunction
" }}}

" neosnippet {{{
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory='~/.vim/snippets'
" }}}

" error marker {{{
let g:errormarker_errortext     = '!!'
let g:errormarker_warningtext   = '??'
let g:errormarker_errorgroup    = 'Error'
let g:errormarker_warninggroup  = 'ToDo'
" }}}

" TagBar {{{
nnoremap <F8> <C-u>:TagbarToggle<CR>
" }}}

" yankaround.vim {{{
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
" }}}

" Lokaltog/vim-easymotion {{{
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key=";"
let g:EasyMotion_grouping=1
" }}}

" Python {{{

" Use tabs of 4 spaces when writing Python
autocmd MyAutoCmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd MyAutoCmd FileType setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

" jedi-vim
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
  autocmd MyAutoCmd FileType python setl omnifunc=jedi#completions
  let g:jedi#completions_enabled = 0
  let g:jedi#auto_vim_configuration = 0
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
endfunction

" }}}

" Markdown {{{
autocmd MyAutoCmd BufNewFile, BufRead *.{md} set filetype=markdown
" }}}

" indentLine {{{
let g:indentLine_faster = 1
" }}}

" other key bindings {{{

" navigate through windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" more intuitive move of cursors when line is wraped around
nnoremap j gj
nnoremap k gk

" centralize when searching
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" disable unnecessary commands
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

" }
