" general settings
set ts=2 sw=2
set expandtab
set autoindent
set number
set mouse=a
set encoding=utf-8
set clipboard=unnamedplus
set splitbelow splitright
set title
set nobackup
set nowritebackup
set noswapfile " get rid of swapfiles everywhere
set dir=/tmp
set nocursorline
set wildmode=longest:full,full
set smartcase

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

filetype plugin indent on

autocmd InsertEnter,InsertLeave * set cul!

" set cursor to line when insert
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" use ctrl-[hjkl] to navigate splits
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" fzf shortcuts
nnoremap <C-f> :Files<CR> 

"To create a new tab
nnoremap <C-t> :tabnew<Space>
nnoremap <M-Left> :tabprevious<CR>
nnoremap <M-Right> :tabnext<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" coc-explorer key mapping
nnoremap <C-e> :CocCommand explorer<CR>

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>

" plugins
call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'thaerkh/vim-indentguides'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'wakatime/vim-wakatime'
Plug 'lilydjwg/colorizer'
Plug 'townk/vim-autoclose'
Plug 'nikolvs/vim-sunbather'

" lsp plugins
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

call plug#end()

let g:indentguides_toggleListMode = 0

colorscheme sunbather

set background=dark

hi Normal ctermfg=white guifg=white
hi Normal ctermbg=black guibg=black

hi StatusLine ctermfg=white guifg=white
hi StatusLine ctermbg=black guibg=black

hi PmenuSel ctermfg=white

hi CursorColumn ctermbg=168

" custom statusline

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0 ? '  '.l:branchname.' ' : ''
endfunction

set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

" set statusline=%F%m%r%h%w\ [%{&ff}]\ %{strftime('%H:%M:%S')}

" lsp server settings {
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes

    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000

    autocmd! BufWritePre *.rs,*.go,*.ts,*.tsx,*js,*.jsx call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" }
