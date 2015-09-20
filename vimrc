call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
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
set colorcolumn=120
set cursorline
set incsearch
set hlsearch

" Show invisibles.
set listchars=trail:·,tab:▸\ ,eol:¬
set list

syntax on
filetype plugin indent on

imap jk <ESC>
imap kj <ESC>


" custom functions
cnoremap <c-x> <c-r>=<SID>PasteEscaped()<cr>

function! s:PasteEscaped()
	echo "\\".getcmdline()."\""
	let char = getchar()
	if char == "\<esc>"
		return ''
	else
		let register_content = getreg(nr2char(char))
		let escaped_register = escape(register_content, '\'.getcmdtype())
		return substitute(escaped_register, '\n', '\\n', 'g')
	endif
endfunction

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

nnoremap <Leader><CR> :nohlsearch<CR>

function! s:VSetSearch()
	let temp = @s
	norm! gv"sy let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
	let @s = temp
endfunction

" Insert a arrows with Ctrl+L
imap <c-l> <space>=><space>

"autocmd BufWritePost * call system("ctags -R")
autocmd BufRead,BufNewFile *.step set ft=ruby
autocmd BufRead,BufNewFile *.hamlc set ft=haml
autocmd FileType ruby setlocal expandtab
autocmd FileType ruby imap <c-l> <space>=><space>
autocmd FileType fancy setlocal expandtab
autocmd FileType coffee setlocal expandtab
autocmd FileType coffee imap <c-l> <space>-><space>
autocmd FileType markdown setlocal spell
autocmd FileType mustache setlocal expandtab
autocmd User Rails Rnavcommand exhibit app/exhibits --glob=**/*
autocmd User Rails Rnavcommand template app/template --glob=**/* --suffix=.mustache
