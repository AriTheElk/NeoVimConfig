"  _   _         __     ___              ____             __ _       
" | \ | | ___  __\ \   / (_)_ __ ___    / ___|___  _ __  / _(_) __ _ 
" |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \  | |   / _ \| '_ \| |_| |/ _` |
" | |\  |  __/ (_) \ V / | | | | | | | | |__| (_) | | | |  _| | (_| |
" |_| \_|\___|\___/ \_/  |_|_| |_| |_|  \____\___/|_| |_|_| |_|\__, |
"                             By Garet McKinley @garetmckinley |___/ 
"

" This is a configuration that transforms NeoVim into a JavaScript focused IDE
" Features include: file navigator, fuzzy file search, git controls, powerful
" code navigation, 
"
" requires: fzf figlet powerline


"  ____  _             _           
" |  _ \| |_   _  __ _(_)_ __  ___ 
" | |_) | | | | |/ _` | | '_ \/ __|
" |  __/| | |_| | (_| | | | | \__ \
" |_|   |_|\__,_|\__, |_|_| |_|___/
"                |___/
"
call plug#begin('~/.vim/plugged')

" Visual Plugins
Plug 'dracula/vim', { 'name': 'dracula' }

" Sidebar
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Code Navigation Plugins
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'

" File Navigation Plugins
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Utility Plugins
Plug 'scrooloose/nerdcommenter'

" Git Plugins
Plug 'tpope/vim-fugitive'


" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Code Scratchpad
Plug 'metakirby5/codi.vim'

" Tmux Plugins
Plug 'christoomey/vim-tmux-navigator'

" Airline Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Formatting/Linting
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }


"let g:prettier#autoformat = 1
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" =============================================================== "
" LANGUAGE SPECIFIC PLUGINS ||||||||||||||||||||||||||||||||||||| "
" =============================================================== "

" JavaScript Plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" =============================================================== "
" ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| "
" =============================================================== "

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


"  _____    _ _ _             
" | ____|__| (_) |_ ___  _ __ 
" |  _| / _` | | __/ _ \| '__|
" | |__| (_| | | || (_) | |   
" |_____\__,_|_|\__\___/|_|   
"
"

set t_Co=256
set t_ZH=^[[3m
set t_ZR=^[[23m

" Colorscheme
set background=dark
syntax on
colorscheme dracula


" Colorscheme overrides
hi Normal ctermbg=234

" Enable italic comments
" TODO: allow italics to be toggled via VMUX_VIM_ITALICS
hi Comment cterm=italic ctermfg=61


" Code formatting
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab
set smartindent

" TODO: allow line numbers to be toggled via VMUX_VIM_NUMBERS
"set number

filetype plugin on

" Required for devicons
set encoding=UTF-8

" set fillchars+=vert:│



" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


"  _  __          _     _           _     
" | |/ /___ _   _| |__ (_)_ __   __| |___ 
" | ' // _ \ | | | '_ \| | '_ \ / _` / __|
" | . \  __/ |_| | |_) | | | | | (_| \__ \
" |_|\_\___|\__, |_.__/|_|_| |_|\__,_|___/
"           |___/

" NERDtree keybinds
map <C-n> :NERDTreeToggle<CR>


" move visual lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Pane navigation
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>


" =============================================================== "
" NEOCLIDE/COC |||||||||||||||||||||||||||||||||||||||||||||||||| "
" =============================================================== "

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>



"  ____  _             _          ____             __ _       
" |  _ \| |_   _  __ _(_)_ __    / ___|___  _ __  / _(_) __ _ 
" | |_) | | | | |/ _` | | '_ \  | |   / _ \| '_ \| |_| |/ _` |
" |  __/| | |_| | (_| | | | | | | |__| (_) | | | |  _| | (_| |
" |_|   |_|\__,_|\__, |_|_| |_|  \____\___/|_| |_|_| |_|\__, |
"                |___/                                  |___/
"



" =============================================================== "
" STARTIFY |||||||||||||||||||||||||||||||||||||||||||||||||||||| "
" =============================================================== "

let g:startify_bookmarks = [
  \ '~/.config/nvim/init.vim',
  \ '~/code'
  \ ]

let g:startify_lists = [
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]

let g:startify_custom_header = systemlist('figlet Vmux')

" =============================================================== "
" NERDTREE |||||||||||||||||||||||||||||||||||||||||||||||||||||| "
" =============================================================== "

" Automatically open when loading a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Automatically close nvim if the only window open is NERDtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Git status icons
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
  \ }


" =============================================================== "
" JAVASCRIPT |||||||||||||||||||||||||||||||||||||||||||||||||||| "
" =============================================================== "

" Enable syntax coloring for JSDocs
let g:javascript_plugin_jsdoc = 1
" Enable syntax colors for flow
let g:javascript_plugin_flow = 1



" =============================================================== "
" AIRLINE ||||||||||||||||||||||||||||||||||||||||||||||||||||||| "
" =============================================================== "

let g:airline_theme='dracula'



" =============================================================== "
" FZF ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| "
" =============================================================== "

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <expr> <c-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"

augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" =============================================================== "
" SNEAK ||||||||||||||||||||||||||||||||||||||||||||||||||||||||| "
" =============================================================== "

let g:sneak#label = 1

map ; <Plug>(easymotion-prefix)


" =============================================================== "
" CODI SCRATCHPAD ||||||||||||||||||||||||||||||||||||||||||||||| "
" =============================================================== "

let g:codi#autocmd = 'InsertLeave'
