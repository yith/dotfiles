augroup MyAutoCmd
  autocmd!
augroup END

" neobundle
set nocompatible
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle'))

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

NeoBundleLazy 'h1mesuke/unite-outline', {
  \ 'autoload': {
  \   'unite_sources': ['outline'],
  \ }}

NeoBundleLazy 'Shougo/neomru.vim', {
  \ 'autoload': {
  \   'unite_sources': ['file_mru'],
  \ }}

NeoBundleLazy 'Shougo/vimfiler', {
  \ 'depends': ['Shougo/unite.vim'],
  \ 'autoload': {
  \     'commands' : [ 'VimFilerTab', 'VimFiler', 'VimFilerExplorer', 'VimFilerBufferDir' ]
  \ }}

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'thinca/vim-quickrun'

" Haskell

" indent
NeoBundle 'kana/vim-filetype-haskell', {
  \ 'autoload': {
  \   'filetypes': ['haskell']
  \ }}

" ghc-mod
NeoBundle 'eagletmt/ghcmod-vim', {
  \ 'autoload': {
  \   'filetypes': ['haskell']
  \ }}

" completion
NeoBundle 'ujihisa/neco-ghc', {
  \ 'autoload': {
  \   'filetypes': ['haskell']
  \ }}

" hoogle
NeoBundleLazy 'ujihisa/ref-hoogle', {
  \ 'autoload': {
  \   'filetypes': ['haskell']
  \ }}


" markdown
NeoBundle 'plasticboy/vim-markdown', {
  \ 'autoload': {
  \   'filetypes': ['markdown']
  \ }}


" neocomplete
if has('lua') && v:version >= 703
  NeoBundle 'Shougo/neocomplete.vim'
  let g:neocomplete#enable_at_startup = 1
  let s:hooks = neobundle#get_hooks("neocomplete.vim")
  function! s:hooks.on_source(bundle)
    let g:acp_enableAtStartup = 0
    let g:neocomplet#enable_smart_case = 1
  endfunction
else
  NeoBundle 'Shougo/neocomplcache.vim'
  let g:neocomplcache_enable_at_startup = 1
  let s:hooks = neobundle#get_hooks("neocomplcache.vim")
  function! s:hooks.on_source(bundle)
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_smart_case = 1
  endfunction
endif


" reference
NeoBundle 'thinca/vim-ref'


NeoBundleLazy 'Shougo/vimshell.git', {
  \ 'autoload': {
  \   'commands': ['VimShell', 'VimShellPop', 'VimShellCreate']
  \ }}

NeoBundle 'mkitt/tabline.vim.git'
NeoBundle 'itchyny/lightline.vim'

NeoBundle 'Lokaltog/vim-easymotion'
"NeoBundle 'troydm/easybuffer.vim'

NeoBundle 'tomasr/molokai.git'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/errormarker.vim.git'

NeoBundle 'tpope/vim-surround'
NeoBundle 'YankRing.vim'
NeoBundle 'eregex.vim'

NeoBundleLazy 'mattn/emmet-vim', {
  \ 'autoload': {
  \   'filetypes': ['html', 'css', 'htmldjango']
  \ }}
NeoBundle 'scrooloose/syntastic'

NeoBundleLazy 'majutsushi/tagbar', {
  \ 'autoload': {
  \   'commands': ['TagbarToggle'],
  \ }}

" Python
NeoBundleLazy 'davidhalter/jedi-vim', {
  \ 'autoload': {
  \   'filetypes': ['python', 'python3', 'htmldjango']
  \ }}
NeoBundleLazy 'lambdalisue/vim-django-support', {
  \ 'autoload': {
  \   'filetypes': ['python', 'python3', 'htmldjango']
  \ }}

" JavaScript
NeoBundleLazy 'leafgarland/typescript-vim', {
  \ 'autoload': {
  \   'filetypes': ['typescript']
  \ }}

filetype plugin indent on     " Required!

"   Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
endif

" display
set showmatch
set number
set ruler
set cursorline
set showcmd
" indent
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
" line
set wrap
set colorcolumn=80
" backup
set nowritebackup
set nobackup
set noswapfile
" etc
set hidden
set smartcase
set ignorecase
set history=1000
set backspace=indent,eol,start
set hlsearch
set incsearch
syntax on
"
" lightline.vim
set laststatus=2

" colorschehme
colorscheme molokai
let g:molokai_original = 1

" unite.vim
let s:hooks = neobundle#get_hooks('unite.vim')
function! s:hooks.on_source(bundle)
  let g:unite_enable_start_insert = 1

  call unite#custom_default_action('source/bookmark/directory', 'vimfiler')
  call unite#custom_default_action('directory', 'vimfiler')
  call unite#custom_default_action('directory_mru', 'vimfiler')
endfunction

" vimfiler
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

" neosnippet
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

" VimShell
nnoremap <silent> vs :<C-u>VimShell<CR>
nnoremap <silent> vsc :<C-u>VimShellCreate<CR>
nnoremap <silent> vp :<C-u>VimShellPop<CR>

" marker
let g:errormarker_errortext     = '!!'
let g:errormarker_warningtext   = '??'
let g:errormarker_errorgroup    = 'Error'
let g:errormarker_warninggroup  = 'ToDo'

" TagBar
nnoremap <F8> <C-u>:TagbarToggle<CR>

" vim-indent-guides
let s:hooks = neobundle#get_hooks('vim-indent-guides')
function! s:hooks.on_source(bundle)
  let g:indent_guides_guide_size = 2
  let g:indent_guides_auto_colors = 0
  hi IndentGuidesOdd  ctermbg=17
  hi IndentGuidesEven ctermbg=52
  IndentGuidesEnable
endfunction

" encoding
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

" ctags
set tags=tags;

" EasyBuffer
"nnoremap <F3> :<C-u>EasyBuffer<CR>

" Lokaltog/vim-easymotion
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key=";"
let g:EasyMotion_grouping=1

" use ag
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--line-numbers --nogroup --nocolor --ignore ''.git'''
  let g:unite_source_grep_recursive_opt = ''
endif

" Use tabs of 4 spaces when writing Python and Django
autocmd MyAutoCmd FileType python setl expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd MyAutoCmd FileType htmldjango setl expandtab tabstop=2 shiftwidth=2 softtabstop=2

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

" key bindings

" change window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" more intuitive move of cursors when line is wraped around
nnoremap j gj
nnoremap k gk

" centralize when searching
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz
"nnoremap g* g*zz
"nnoremap g# g#zz

" disable unnecessary commands
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

" tags
"nnoremap <C-]> g<C-]>

" unite.vim
nnoremap [unite] <Nop>
nmap <Space>u [unite]
nnoremap <silent> <F2> :<C-u>VimFilerBufferDir<CR>
nnoremap <silent> <F3> :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]c :<C-u>UniteWithCurrentDir file_mru file<CR>
nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir file_mru file<CR>
nnoremap <silent> [unite]m :<C-u>Unite bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep<CR>

" ghc-mod
nnoremap <silent> T :<C-u>GhcModType<CR>

" markdown
autocmd MyAutoCmd BufNewFile, BufRead *.{md} set filetype=markdown
