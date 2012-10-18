call pathogen#runtime_append_all_bundles()

call pathogen#helptags()
" While I'm working with JRuby, switch Syntastic to passive to avoid shitty
" wait times during syntax checks.
"let g:syntastic_mode_map = { 'mode': 'active',
"			\ 'active_filetypes': [],
"			\ 'passive_filetypes': ['ruby'] }
"
set nocompatible
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
" set cursorline
set incsearch
set hlsearch

" I'm not dead-set about enabling the mouse, but it makes Xselection much
" easier since I have 
if has('mouse')
	set mouse=a
endif

" Show invisibles.
set listchars=trail:·,tab:▸\ ,eol:¬
set list

" Some colorscheme tweaks.
" let base16colorspace = "256"
colorscheme base16
set background=dark


syntax on
filetype plugin indent on

"" Syntastic Plugin stuff.
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1

"" Eclim bindings.
"let g:EclimHome = '/usr/share/vim/vimfiles/eclim'
"let g:EclimEclipseHome = '/usr/share/eclipse'

""LaTeX-suite bindings.
set grepprg=grep\ -nH\ $*
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = '/usr/bin/epdfview'


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

" Insert a hashrocket with Ctrl+L
imap <c-l> <space>=><space>

"autocmd BufWritePost * call system("ctags -R")
autocmd BufRead,BufNewFile *.step set ft=ruby
autocmd BufRead,BufNewFile *.hamlc set ft=haml
autocmd FileType ruby setlocal expandtab
autocmd FileType fancy setlocal expandtab
autocmd FileType markdown setlocal textwidth=80 spell
autocmd FileType mustache setlocal expandtab
autocmd User Rails Rnavcommand exhibit app/exhibits --glob=**/*
autocmd User Rails Rnavcommand template app/template --glob=**/* --suffix=.mustache
