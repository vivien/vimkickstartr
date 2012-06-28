" Vim KickStart

" DOCUMENTATION {{{
"  _   ___         __ ___     __    ______           __
" | | / (_)_ _    / //_(_)___/ /__ / __/ /____ _____/ /_
" | |/ / /  ' \  / ,< / / __/  '_/_\ \/ __/ _ `/ __/ __/
" |___/_/_/_/_/ /_/|_/_/\__/_/\_\/___/\__/\_,_/_/  \__/
"
" This is a one-file setup for Vim.
" It uses VAM, a pure VimL addons manager
" (see https://github.com/MarcWeber/vim-addon-manager).
"
" Plugins found in the ".vim-addons" file in your home directory will be
" activated. A sample plugin list looks like:
"
"     $ cat ~/.vim-addons
"     " My list of Vim addons
"     Powerline
"     surround
"     endwise
"
" Find addons with ":AddonsInfo <Tab>".
"
" Vivien Didelot <vivien@didelot.org>
" https://github.com/v0n/vim-kickstart
"
" }}}

" VAM SETUP {{{
"
" You shouldn't have to edit this.
" See ":help VAM-installation" for alternatives

func! SetupVAM()
	let l:vam_install_path = expand('$HOME').'/.vim/vim-addons'
	let l:addons_file = expand('$HOME').'/.vim-addons'
	let l:addons = []

	let g:vim_addon_manager = {}
	let g:vim_addon_manager['auto_install'] = 1
	let g:vim_addon_manager['shell_commands_run_method'] = 'system'
	set nomore

	if !isdirectory(l:vam_install_path.'/vim-addon-manager/autoload')
		call mkdir(l:vam_install_path, 'p')
		silent execute '!git clone --depth=1 https://github.com/MarcWeber/vim-addon-manager.git '.shellescape(l:vam_install_path, 1).'/vim-addon-manager'
		execute 'helptags '.fnameescape(l:vam_install_path.'/vim-addon-manager/doc')
	endif
	execute 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

	if filereadable(l:addons_file)
		call extend(l:addons, filter(readfile(l:addons_file), 'v:val !~ "^\\s*$\\|^\""'))
	endif

	call vam#ActivateAddons(l:addons)
endfunc

call SetupVAM()

" }}}

" SETTINGS
"
" Type ":help <option>" for details

set nocompatible
set encoding=utf-8
set nonumber
set ruler
syntax enable

set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set list
set listchars=tab:\ \ ,trail:.
set listchars+=extends:>,precedes:<

set nohlsearch
set incsearch
set ignorecase
set smartcase

set wildmenu
set wildmode=list:full,full
set wildignore+=*.swp,*~
set wildignore+=.git,.svn
set wildignore+=*.o,*.obj,*.class
set wildignore+=*.zip,*.tar,*.gz,*.tgz,*.bz2

colorscheme ron

set laststatus=2
set showcmd
set shortmess=a
set modeline

filetype plugin indent on

if has("autocmd")
	autocmd BufNewFile,BufRead *.json setfiletype javascript
	autocmd BufNewFile,BufRead *.{txt,md,markdown} set nolist spell wrap textwidth=80
	autocmd BufNewFile,BufRead {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,config.ru,*.rake} setfiletype ruby
endif

runtime! macros/matchit.vim

"set backupdir=~/.vim/_backup
"set directory=~/.vim/_temp

"let mapleader=","

" Toggle folding with "za"
" vim: foldmethod=marker
