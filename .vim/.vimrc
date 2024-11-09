" basic configs
:set number
:syntax on
:set tabstop=4
:set expandtab
:set shiftwidth=4
:set mouse=a
:set wrap
:set wildmode=full
:set background=dark

let mapleader = " "

" mappings with leader
nnoremap <leader>w :w<CR> 
nnoremap <leader>q :q<CR>
nnoremap <leader>ev :e $MYVIMRC<CR> 
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>U :undotreetoggle<CR> 
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>

" mappings to navigate between buffers
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" vimplug
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

" cursor config
let &t_si = "\<esc>]50;cursorshape=1\x7"
let &t_sr = "\<esc>]50;cursorshape=2\x7"
let &t_ei = "\<esc>]50;cursorshape=0\x7"
set title
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast
set noswapfile

" relative numbers
set number relativenumber

" more cursor settings
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\e[3 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"  " Insert mode: vertical line
    let &t_SR = "\e[3 q"  " Replace mode: underscore
    let &t_EI = "\e[2 q"  " Normal mode: block
endif

" NERDTree navigation mappings
augroup NERDTreeConfig
  autocmd!
  autocmd FileType nerdtree nmap <buffer> h <Plug>NERDTreeClose
  autocmd FileType nerdtree nmap <buffer> l <CR>
  autocmd FileType nerdtree nmap <buffer> j j
  autocmd FileType nerdtree nmap <buffer> k k
augroup END

" Navigate buffers/tabs with leader
nnoremap <leader>bb :bprevious<CR>
nnoremap <leader>bn :bnext<CR>

" Custom functions for the alternative method
function! NERDTreeCustomClose()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        call n.parent.closeChildren()
        call b:NERDTree.render()
    endif
endfunction

function! NERDTreeCustomOpen()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        call n.open()
    endif
endfunction

" remap esc
inoremap jj <esc>
inoremap kk <esc>
inoremap jk <esc>

" autocmd
augroup prettierformat
    autocmd!
    autocmd filetype typescript javascript html markdown
    autocmd bufwritepost *.html,*.js,*.ts,*.md prettier
augroup end

" coc config
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-rust-analyzer',
  \ 'coc-python',
  \ 'coc-html',
  \ 'coc-snippets',
  \ ]

" markdown plugin
let g:vim_markdown_folding_disabled = 1

" Use TAB for completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Optional: Make Enter key select the completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Optional: Enable better completion experience
set completeopt=menu,menuone,noselect
set shortmess+=c   " Don't show completion messages


" rainbow brackets
let g:rainbow_active = 1

" nerdcomment
vmap ++ <plug>nerdcommentertoggle
nmap ++ <plug>nerdcommentertoggle

" color scheme
colorscheme gruvbox

" ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'ctrlp'

" rustfmt
let g:rustfmt_autosave = 1

" remap undotree
" basic configs
:set number
:syntax on
:set tabstop=4
:set expandtab
:set shiftwidth=4
:set mouse=a
:set wrap
:set wildmode=full

" vimplug
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

" cursor config
let &t_si = "\<esc>]50;cursorshape=1\x7"
let &t_sr = "\<esc>]50;cursorshape=2\x7"
let &t_ei = "\<esc>]50;cursorshape=0\x7"
set title
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast
set noswapfile

" nerdtree 
map <c-n> :nerdtreetoggle<cr>

" remap esc
inoremap jj <esc>
inoremap kk <esc>
inoremap jk <esc>

" autocmd
augroup prettierformat
    autocmd!
    autocmd filetype typescript javascript html markdown
    autocmd bufwritepost *.html,*.js,*.ts,*.md prettier
augroup end

" Enable indentation guides
set list
set listchars=tab:\│\ ,trail:·

" coc config
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-rust-analyzer',
  \ 'coc-python',
  \ 'coc-html',
  \ 'coc-snippets',
  \ ]

" markdown plugin
let g:vim_markdown_folding_disabled = 1

" use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" rainbow brackets
let g:rainbow_active = 1

" nerdcomment
vmap ++ <plug>nerdcommentertoggle
nmap ++ <plug>nerdcommentertoggle

" color scheme
colorscheme gruvbox

" ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'ctrlp'

" rustfmt
let g:rustfmt_autosave = 1

" Toggle with colorscheme reset
function! ToggleBackgroundGruvbox()
    if &background == 'dark'
        set background=light
    else
        set background=dark
    endif
endfunction

nnoremap <leader>tb :call ToggleBackgroundGruvbox()<CR>
