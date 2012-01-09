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

" VAM setup {{{
" Return an array of addons from a file
fun GetAddonsList(filename)
  return filter(readfile(a:filename), 'v:val !~ "^\\s*$\\|^\""')
endf

" Tweak from VAM's recommended way to install VAM.
" See https://github.com/MarcWeber/vim-addon-manager/blob/master/doc/vim-addon-manager.txt#L84
fun SetupVAM()
  " YES, you can customize this vam_install_path path and everything still works!
  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  " * unix based os users may want to use this code checking out VAM
  " * windows users want to use http://mawercer.de/~marc/vam/index.php
  "   to fetch VAM, VAM-known-repositories and the listed plugins
  "   without having to install curl, unzip, git tool chain first
  let s:using_vam = 1 " default to using VAM
    let s:auto_install = 0
  if !filereadable(vam_install_path.'/vim-addon-manager/.git/config')
    let s:using_vam = confirm("Install VAM (git clone into ".vam_install_path.")?","&Y\n&N")
    if (s:using_vam == 1)
      " I'm sorry having to add this reminder. Eventually it'll pay off.
      "call confirm("Remind yourself that most plugins ship with documentation (README*, doc/*.txt). Its your first source of knowledge. If you can't find the info you're looking for in reasonable time ask maintainers to improve documentation")
      exec '!p='.shellescape(vam_install_path).'; mkdir -p "$p" && cd "$p" && git clone --depth 1 git://github.com/MarcWeber/vim-addon-manager.git'
      " VAM run helptags automatically if you install or update plugins
      exec 'helptags '.fnameescape(vam_install_path.'/vim-addon-manager/doc')
      let s:auto_install = confirm("Auto install addons (do not prompt)?", "&Y\n&N") % 2
    endif
  endif

  if (s:using_vam == 1)
    " disable sources whose version control command line tool is not
    " installed. If you need more control override the MergeSources
    " function
    if (!exists('g:vim_addon_manager')) | let g:vim_addon_manager = {} | endif
    for scm in ['hg', 'git', 'svn', 'bzr']
      let g:vim_addon_manager[scm.'_support'] = executable(scm)
    endfor

    " Add addons from ~/.vim-addons if this file exists
    let s:addons_file = expand('$HOME').'/.vim-addons'
    if filereadable(s:addons_file)
      call extend(g:addons, GetAddonsList(s:addons_file))
    endif
    call vam#ActivateAddons(g:addons, {'auto_install' : s:auto_install})
  endif

  unlet g:addons
endf

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
