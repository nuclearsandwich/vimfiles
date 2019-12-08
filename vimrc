set ttyfast
set backspace=2
set number
set linebreak
set tabstop=2
set shiftwidth=2
set noexpandtab
set splitright
set splitbelow
set exrc
set laststatus=2
set colorcolumn=80
set cursorline
set incsearch
set hlsearch
set lazyredraw
set showmatch
set mat=2
set noerrorbells
set novisualbell
set listchars=trail:·,tab:▸\ ,eol:¬
set list


call plug#begin('~/.vim/bundle')

Plug 'https://github.com/rhysd/committia.vim'
Plug 'https://github.com/wincent/terminus' " Terminal integration
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'

" Language support, mostly from polyglot.
Plug 'sheerun/vim-polyglot'

" Colors and appearance.
Plug 'https://github.com/jeffkreeftmeijer/vim-dim'
call plug#end()

colorscheme dim
let g:EditorConfig_exec_path='/usr/bin/editorconfig'
let g:EditorConfig_core_mode='external_command'
" Show invisibles.


if has('nvim')
	if has('termguicolors')
		set t_8f=\[[38;2;%lu;%lu;%lum
		set t_8b=\[[48;2;%lu;%lu;%lum
		set termguicolors
	endif
endif

syntax on
filetype plugin indent on

imap jk <ESC>
imap kj <ESC>

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

nnoremap <Leader><CR> :nohlsearch<CR>
nnoremap <Leader>ff :Unite file_rec<CR>

function! s:VSetSearch()
	let temp = @s
	norm! gv"sy let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
	let @s = temp
endfunction

"autocmd BufWritePost * call system("ctags -R")
autocmd BufRead,BufNewFile *.step set ft=ruby
autocmd BufRead,BufNewFile *.hamlc set ft=haml
autocmd FileType ruby setlocal expandtab
autocmd FileType yaml setlocal commentstring=#\ %s
autocmd FileType ruby imap <c-l> <space>=><space>
autocmd FileType fancy setlocal expandtab
autocmd FileType coffee setlocal expandtab
autocmd FileType coffee imap <c-l> <space>-><space>
autocmd FileType mustache setlocal expandtab

set cursorline
"highlight CursorLine cterm=None ctermbg=black
