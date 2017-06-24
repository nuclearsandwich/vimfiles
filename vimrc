runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
set rtp+=~/srcbin/fzf

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
set lazyredraw
set showmatch
set mat=2
set noerrorbells
set novisualbell
colorscheme anotherdark

let g:EditorConfig_exec_path='/usr/bin/editorconfig'
let g:EditorConfig_core_mode='external_command'

" Show invisibles.
set listchars=trail:·,tab:▸\ ,eol:¬
set list

if has('nvim')
endif

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
nnoremap <Leader>ff :Unite file_rec<CR>

function! s:VSetSearch()
	let temp = @s
	norm! gv"sy let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
	let @s = temp
endfunction

" Commentary bindings to \\\
xmap \\  <Plug>Commentary<CR>
nmap \\  <CR><Plug>Commentary
nmap \\\ <Plug>CommentaryLine<CR>
nmap \\u <Plug>CommentaryUndo<CR>

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
highlight CursorLine cterm=None ctermbg=black
