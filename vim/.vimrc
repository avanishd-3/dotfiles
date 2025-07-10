"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Essentials
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible "Disable compatibility w/ Vi
set tabstop=4 "Tab size of 4
set shiftwidth=4 ">> and << = 4 spaces
"set expandtab
"set smarttab
set showmatch "visually indicate matching (), {}, []
set smartcase "case sensitive searches when using backspace
set backspace=2 "Backspace behaves like modern editor
set autoindent "automatic indent
set formatoptions=c,q,r,t "Auto format comments and wrap text
set cursorline "Highlight cursor line under the cursor horizontally
set laststatus=2 "status line always at bottom of Vim 
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
let loaded_matchparen = 1 "highlight matching (), {}, [] when cursor is on them
set mouse=a "Enables mouse support for Insert, Visual, Normal mode
set nohlsearch "Turns off highlight of search matches
set number "Turn on line numbers
syntax on "Enable syntax highlighting
set clipboard+=unnamedplus,unnamed,autoselect "Use system clipboard on Windows
set vb t_vb= "Turn off audio and visual bell in Vim"
"set wildmenu "Enable auto completion menu after pressing TAB


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Automatically install Vim-plug to manage plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
Plug 'preservim/nerdtree' "Directory tree
Plug 'dense-analysis/ale' "Linting
Plug 'octol/vim-cpp-enhanced-highlight' "C++ highlighting
Plug 'sainnhe/everforest' "Green colorscheme
Plug 'Raimondi/delimitMate' "Automatic closing of quotes, parens, brackets
Plug 'airblade/vim-gitgutter' "Git diff

call plug#end() "Plugins visible to Vim after this


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set font
if has("mac") || has("macunix")
    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif

" Set colorscheme
set background=dark
colorscheme everforest "Colorscheme

"View Git diff
let g:gitgutter_terminal_reports_focus=0 "For terminals that do not report focus events"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-o> :NERDTreeToggle<CR>