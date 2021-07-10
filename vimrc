" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Remap leader to space bar
:let mapleader = "\<Space>"

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Search up parent directies until you find .tags file created by ctags
" Use <C-]> to navigate to definition
" Use <C-T> to go back
set tags=./.tags;/

set showmatch " show matching braces when text indicator is over them

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" vim can autodetect this based on $TERM (e.g. 'xterm-256color')
" but it can be set to force 256 colors
" set t_Co=256
if has('gui_running')
    colorscheme solarized
    let g:lightline = {'colorscheme': 'solarized'}
elseif &t_Co < 256
    colorscheme default
    set nocursorline " looks bad in this mode
else
    set background=dark
    let g:solarized_termcolors=256 " instead of 16 color with mapping in terminal
    colorscheme solarized
    " customized colors
    highlight SignColumn ctermbg=234
    highlight StatusLine cterm=bold ctermfg=245 ctermbg=235
    highlight StatusLineNC cterm=bold ctermfg=245 ctermbg=235
    let g:lightline = {'colorscheme': 'dark'}
    highlight SpellBad cterm=underline
    " patches
    highlight CursorLineNr cterm=NONE
endif

" Handle file indentation.
filetype plugin indent on " enable file type detection
set autoindent

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" Show x/y count when searching
" at occurrence x out of y total occurrences
set shortmess-=S

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
map <C-a> <Nop> " Unbind for tmux
map <C-x> <Nop>

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" quicker saving to/from clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p

" quicker no highlighting after searches
nnoremap <leader>h <Esc>:noh<cr>

" quicker file saving and quitting using leader
nnoremap <leader>w <Esc>:w<cr>
nnoremap <leader>q <Esc>:q<cr>

" Apply ANSI escape formatting to emulate colorized terminal output
nnoremap <leader>e <Esc>:AnsiEsc<cr>

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" Remap escape key in insert mode
inoremap kj <Esc>

" --------- Basic Editing Config ----------
" Set up line breaks - wrap and linebreak enabled, and list disabled
" Use gj, gk, g$, aand g^ for line break navigation
command! -nargs=* Wrap set wrap linebreak nolist
set textwidth=0 wrapmargin=0 " Disable auto physical line wraps

set scrolloff=5 " show lines above and below cursor (when possible)
set noshowmode " hide mode displayed on bottom left
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set lazyredraw " skip redrawing screen in some cases
set autochdir " automatically set current directory to directory of last opened file
set history=8192 " more history
set nojoinspaces " suppress inserting two spaces between sentences

" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

set incsearch " incremental search (as string is being typed)
set hls " highlight search

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" --------- Plugin settings -----------

" Syntastic
let g:syntastic_always_populate_loc_list = 1 " Fill location-list with errors
let g:syntastic_auto_loc_list = 1 " Auto open error window when errors detected
let g:syntastic_check_on_open = 0 " Auto check files upon open and save
let g:syntastic_check_on_wq = 0 " Auto check files upon write or quit
let g:syntastic_mode_map = { 'mode': 'passive' } " Default to passive mode on all file types

nnoremap <Leader>s :SyntasticCheck<CR> " Check for errors
nnoremap <Leader>r :SyntasticReset<CR> " Reset error window
nnoremap <Leader>m :SyntasticToggleMode<CR> " Toggle manual and auto checking

let g:syntastic_asm_checkers = ['gcc']
let g:syntastic_c_checkers = ['clang_tidy', 'cppcheck']
let g:syntastic_cmake_checkers = ['cmakelint']
let g:syntastic_coq_checkers = ['coqtop']
let g:syntastic_cpp_checkers = ['clang_tidy', 'cppcheck']
let g:syntastic_dockerfile_checkers = ['hadolint']
let g:syntastic_go_checkers = ['golangci_lint']
let g:syntastic_java_checkers = ['javac']
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_markdown_checkers = ['proselint']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_rust_checkers = ['cargo']
let g:syntastic_sh_checkers = ['shellcheck', 'shfmt']
let g:syntastic_tex_checkers = ['proselint']
let g:syntastic_text_checkers = ['proselint']
let g:syntastic_verilog_checkers = ['iverilog']
let g:syntastic_vim_checkers = ['vint']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_zsh_checkers = ['zsh']

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Forward search PDF using Skim
map ,r :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> %<.pdf<CR>

" Open conceal when cursor is over the text
let g:indentLine_concealcursor = ""

" NERDTree-like File Exploration with Native Vim netrw plugin
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:netrw_sort_sequence = '[\/]$,\<core\%(\.\d\+\)\=\>,\~\=\*$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$'
nnoremap <leader>n <Esc>:Vex<cr>

" Options for vim-markdown-preview
let vim_markdown_preview_github=1  " Use Grip - GitHub style Markdown - for previewing
let vim_markdown_preview_toggle=1  " Update preview with Ctrl-p
let vim_markdown_preview_browser='Safari'
let vim_markdown_preview_temp_file=1  " Remove rendered html after viewing in browser
