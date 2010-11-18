call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set nocompatible
set number
set linebreak
set tabstop=2
set shiftwidth=2
set noexpandtab
set background=dark
"set t_Co=256
colorscheme dante
syntax on
filetype plugin indent on
"command -bar -nargs=1 OpenURL :!surf <args>

" Eclim bindings.
let g:EclimHome = '/usr/share/vim/vimfiles/eclim'
let g:EclimEclipseHome = '/usr/share/eclipse'

"LaTeX-suite bindings.
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_ViewRule_pdf = '/usr/bin/evince'
