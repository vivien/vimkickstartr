" Vim KickStart

" Documentation {{{
"  _    ___ __  ___   __ __ _       __   _____ __             __
" | |  / (_)  |/  /  / //_/(_)_____/ /__/ ___// /_____ ______/ /_
" | | / / / /|_/ /  / ,<  / // ___/ //_/\__ \/ __/ __ `/ ___/ __/
" | |/ / / /  / /  / /| |/ // /__/ ,<  ___/ / /_/ /_/ / /  / /_
" |___/_/_/  /_/  /_/ |_/_/ \___/_/|_|/____/\__/\__,_/_/   \__/
"
" A Vim setup using the great MarcWerber's Vim Addons Manager (VAM).
" https://github.com/MarcWeber/vim-addon-manager
"
" The only requirement is this vimrc file.
" It contains everything needed to install VAM and plugins.
" Plugins can be listed in a simple ~/.vim-addons file.
"
" Sample ~/.vim-addons file:
"
"   " My list of ViM addons
"   snipmate-snippets
"   supertab
"   fugitive
"
" This file might get big, but folding is made for that (:he za).
"
" Vivien Didelot <vivien@didelot.org>
" https://github.com/v0n/vim-kickstart
" }}}

" Plugins list. Populated here and/or from the ~/.vim-addons file.
let g:addons = []

" VAM Setup {{{
" :he VAM-installation

fun! EnsureVamIsOnDisk(vam_install_path)
  if !filereadable(a:vam_install_path.'/vim-addon-manager/.git/config')
    call mkdir(a:vam_install_path, 'p')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(a:vam_install_path, 1).'/vim-addon-manager'
    exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
  endif
endf

fun! GetAddonsList(filename)
  return filter(readfile(a:filename), 'v:val !~ "^\\s*$\\|^\""')
endf

fun! SetupVAM()
  let g:vim_addon_manager = {}
  let g:vim_addon_manager['auto_install'] = 1
  let g:vim_addon_manager['shell_commands_run_method'] = 'system'
  set nomore

  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  call EnsureVamIsOnDisk(vam_install_path)
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  let s:addons_file = expand('$HOME').'/.vim-addons'
  if filereadable(s:addons_file)
    call extend(g:addons, GetAddonsList(s:addons_file))
  endif
  call vam#ActivateAddons(g:addons)
  unlet g:addons
endfun

call SetupVAM()
" }}}

" Vim global configuration {{{
" Mostly stolen from Janus.

set nocompatible

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Default color scheme
color torte

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Use modeline overrides
set modeline
set modelines=10

" Show (partial) command in the status line
set showcmd

" Decrease messages size
set shortmess=a

" Directories for swp files
"set backupdir=~/.vim/backup
"set directory=~/.vim/backup
" }}}

" Plugins specific configuration {{{
" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
"set noequalalways

" Turn off jslint errors by default
"let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
"let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

if has("gui_running")
  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =
endif

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
"let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Gundo configuration
nmap <F5> :GundoToggle<CR>
imap <F5> <ESC>:GundoToggle<CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" }}}

" Other mappings {{{
" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" }}}

" vim: fdm=marker
finish
