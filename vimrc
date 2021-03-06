
" Plugin names found in "~/.vim-addons" are activated on startup.
" Update manager and addons with ":UpdateAddons".
" Find addons with ":AddonsInfo <Tab>".
"
" VimKickStartR: https://github.com/vivien/vimkickstartr
" VAM: https://github.com/MarcWeber/vim-addon-manager

" Addon Manager Setup {{{
" You don't need to edit the following function.
" See ":help VAM-installation" for alternatives.
function! SetupVAM()
	let l:vam_install_path = expand('$HOME').'/.vim/vim-addons'
	let l:addons_file = expand('$HOME').'/.vim-addons'
	let l:addons = []
	let g:vim_addon_manager = {}
	let g:vim_addon_manager['auto_install'] = 1
	let g:vim_addon_manager['shell_commands_run_method'] = 'system'
	set nomore
	if !isdirectory(l:vam_install_path.'/vim-addon-manager/autoload')
		call mkdir(l:vam_install_path, 'p')
		let l:repo = 'https://github.com/MarcWeber/vim-addon-manager.git'
		let l:path = shellescape(l:vam_install_path, 1).'/vim-addon-manager'
		let l:doc = fnameescape(l:vam_install_path.'/vim-addon-manager/doc')
		silent execute '!git clone --depth=1' l:repo l:path
		execute 'helptags' doc
	endif
	execute 'set runtimepath+='.l:vam_install_path.'/vim-addon-manager'
	if filereadable(l:addons_file)
		let l:content = readfile(l:addons_file)
		call extend(l:addons, filter(l:content, 'v:val !~ "^\\s*$\\|^\""'))
	endif
	call vam#ActivateAddons(l:addons)
endfunction
call SetupVAM()
" }}}

" Type ":help <option>" for details

set nocompatible
set encoding=utf-8
set laststatus=2
set modeline
set nonumber
set ruler
set showcmd
set shortmess=at
syntax enable

colorscheme ron

set scrolloff=7

set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab
set formatoptions=croq

set list
set listchars=tab:\ \ ,trail:·
set listchars+=extends:>,precedes:<

set nohlsearch
set incsearch
set ignorecase
set smartcase

set wildmenu
set wildmode=list:full,full
set wildignore+=.git,.svn
set wildignore+=*.swp,*~,*.o,*.obj,*.class
set wildignore+=*.zip,*.tar,*.gz,*.tgz,*.bz2

filetype plugin indent on

if has("autocmd")
	autocmd BufNewFile,BufRead *.json setlocal filetype=javascript
	autocmd BufNewFile,BufRead {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} setfiletype ruby
	autocmd BufReadPost ~/.vim-addons setfiletype vim
	autocmd FileType vim,help setlocal foldmethod=marker keywordprg=:help
endif

runtime! macros/matchit.vim

"set backupdir=~/.vim/_backup
"set directory=~/.vim/_temp

"let mapleader=","
