" author: jupiter
" last modified 2013/07/24

" general
set tabstop=4
set shiftwidth=4
set expandtab
set number
set autoindent
set smartindent
set hlsearch
syntax on

" solarized color scheme
set background=light
colorscheme solarized

" search
set incsearch
set ignorecase
set smartcase

set scrolloff=2

set swapfile
set dir=~/tmp

filetype plugin on
filetype on
filetype plugin indent on

nnoremap <Space> :exec "normal i".nr2char(getchar())."\e"<CR>

"tagbar
nmap <F8> :TagbarToggle<CR>

" SPLITS
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" tab shortcuts
nmap tn :tabn
nmap tp :tabp
nmap tbn :tabnew
nmap tbc :tabclose

set splitbelow
set splitright

" unhilight previous term search
" nmap <silent> <C-u> :nohlsearch<CR><C-u>

" ignore the arrow keys
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>	<NOP>
inoremap <Down>	<NOP>

execute pathogen#infect()
execute pathogen#helptags()

" CSCOPE
" databas dir=~/cscope/migkmip/
if has('cscope')
	set cscopetag cscopeverbose

	if has('quickfix')
		set cscopequickfix=s-,c-,d-,i-,t-,e-
	endif

	command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

" delete spaces at end of lines
command Delsp :%s/\s\+$//

" Tag List
command Tlo :TlistOpen
command Clo :TlistClose
command Tlt :TlistToggle
" same shortcuts, except they are key mappings
" press enter to execute
nmap tlo :TlistOpen
nmap tlc :TlistClose
nmap tlt :TlistToggle

" Make commands
command Mbi :make && ! make install
command Mci :make && make clean && make install
nmap mbi :make && ! make install
nmap mci :make clean && make && make install

nmap ma :make all
nmap mb :make target
