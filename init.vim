"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""" SETS """""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set noswapfile
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set guicursor
set relativenumber
set nu
set nohlsearch
set noerrorbells
set nowrap
set smartcase
set ignorecase
set incsearch
set scrolloff=8
set noshowmode
set colorcolumn=80
set signcolumn=yes
set termguicolors
set cmdheight=2

" To learn
set hidden
set updatetime=300
set shortmess+=c
set nobackup                                                        " Some servers have issues with backup files, see #649.
set nowritebackup



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""" PLUGINS """"""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'                                           " file browsing
Plug 'nvim-telescope/telescope.nvim'                                " fuzzy finder
Plug 'nvim-lua/plenary.nvim'                                        " utility dependency for telescope
Plug 'nvim-lua/popup.nvim'                                          " popup plugin for telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}         " requirement for telescope

Plug 'gruvbox-community/gruvbox'                                    " color scheme

Plug 'maxmellon/vim-jsx-pretty'                                     " enables syntax highlighting for react jsx

Plug 'jiangmiao/auto-pairs'                                         " enables auto pairing of brackets and quotes
Plug 'neoclide/coc.nvim', {'branch': 'release'}                     " auto-completion and snippets
call plug#end()

" Coc extensions
let g:coc_global_extensions = ['coc-lightbulb', 'coc-java', 'coc-git', 'coc-html', 'coc-json', 'coc-snippets', 'coc-jedi',  'coc-xml', 'coc-sh', 'coc-css', 'coc-sql', 'coc-tsserver', 'coc-prettier']

" set gruvbox
colorscheme gruvbox
highlight Normal guibg=none



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""" REMAPS """""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader key maps
" a - code action on on next movement ( eg. caw )
" b
" c - code action or coc command (ca - code action on buffer, c - coc commands )
" d - diagnostics list (can navigate through linting issues)
" e - enable/disable coc extensions (to enable/disable for current buffer)
" f - telescope (ff - find_files, fg - live_grep, fb - find_buffers, fh - find help_tags)
" g - coc goto (gd - definition, gr - reference, gy - type definition, gi - implementation, gf - goto file under cursor)
" h
" i
" j
" k
" l
" m
" n - nerdtree (nn - toggle nerdtree)
" o - outline current buffer
" p - pretty current buffer
" q - quickfix (qf - quickfix)
" r - rename/refactor in current project (rn - rename)
" s
" t
" u
" v - open vimrc
" w
" x
" y
" z

" Other remaps
" <M-e> fast wrap for auto-pairs

let mapleader = " "
inoremap jk <Esc>

" Homemade remaps
nnoremap <silent> <leader>v :e $MYVIMRC<cr>
nmap <M-Right> :vertical resize +1<CR>
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

" Auto-pairs remaps (note: <M-?> is for alt)
" <M-e> fast wrap
" <M-}> fast wrap around closed pair
" <M-n> jump to next closed pair
" See github.com/jiangmiao/auto-pairs for more

" Telescope remaps
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Nerdtree remaps
nnoremap <leader>nn :NERDTreeToggle<cr>

" COC remaps
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <leader>rn <Plug>(coc-rename)
nnoremap <leader>p  ggVG<Plug>(coc-format-selected)
" float navigation
nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>
nnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
vnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap <silent><nowait> <leader>d  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <leader>o  :CocOutline<CR>
" new text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""" AUTOCMDS """""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup MY_GROUP
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    autocmd BufWritePost *.vim source %
augroup END


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup end

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""" Functions """"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
