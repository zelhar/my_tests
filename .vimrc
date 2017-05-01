" /~/.vimrc
set nocompatible

" Remove ALL autocommands for the current group:
autocmd!
if $SUCHECK
    "do something
    "let $HOME=/root
    "goto 9999999
    "so /root/.config/nvim/init.vim
endif

"------- START Plug manager instead of Vundle
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')


"Plug 'Townk/vim-autoclose'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/TextFormat'
"Color Themes
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
"Plugins I am testing to see if they are worth using
"""Plugin 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'JamshedVesuna/vim-markdown-preview'

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
" Initialize plugin system
call plug#end()
"------- END Plug manager instead of Vundle

"make sure it stays on even if I delete Vundle or Neobunlde et al.
filetype plugin indent on

"Switch on syntax highlighting if it wasn't on yet.
"filetype plugin indent on
if !exists("syntax_on")
    syntax on
endif

set nocompatible
"make backspace function like normal apps in insert mode
set backspace=indent,eol,start

set t_Co=256
"for solarized, base16 color themes and others
"let g:solarized_termcolors=256
let base16colorspace=256
set textwidth=80
"colorscheme solarized
"colorscheme blue
set background=dark

"bracket highlight (that's on by default):
"set matchpairs=(:),{:},[:]

" Function that highlights text passing textwidth. Toggle with '\l'
noremap <silent> <Leader>l
      \ :if exists('w:long_line_match') <Bar>
      \   silent! call matchdelete(w:long_line_match) <Bar>
      \   unlet w:long_line_match <Bar>
      \ elseif &textwidth > 0 <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
      \ else <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
      \ endif<CR>

set expandtab
set smarttab
set softtabstop=4
set tabstop=4
set nu!
set shiftwidth=4

set nospell
set spelllang=en,de,es,he

" Read changes to file made by other applications
set autoread

"turn on auto-smart-indent
set autoindent
set smartindent


" Tell vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
"set listchars=eol:¶,tab:>»,trail:·
"set listchars=eol:¬,tab:>»,trail:·
"set listchars=eol:$,tab:>-,trail:-
scriptencoding utf-8
if has("gui_running")
    set listchars=eol:¶,tab:>»,trail:·
"    set listchars=eol:¬,tab:>»,trail:·
else
"    set listchars=eol:$,tab:>-,trail:-
"    set listchars=eol:¶,tab:>»,trail:·
    set listchars=eol:¬,tab:>»,trail:·
endif

" Show whitespace
"set list

" status line (cooment out if put in .vimrc)
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ 
"\[HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ 
            \[POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
"now setting up tabline
"set tabline=[%n]%f%m%r%h%w%y
set showtabline=2

"These motions don't work when I use font-size plugin for urxvt.
nnoremap <C-Down> j<C-e>
nnoremap <C-Up> k<C-y>
vnoremap <C-Down> <Down><C-e>
vnoremap <C-Up> <Up><C-y>
inoremap <C-Down> <C-X><C-e><Down>
inoremap <C-Up> <C-X><C-y><Up>

"scroll half screnn up/down with Alt-Up Alt-Down
nnoremap <A-Down> <C-d>
nnoremap <A-Up> <C-u>
vnoremap <A-Down> <C-d>
vnoremap <A-Up> <C-u>
inoremap <A-Down> <C-d>
inoremap <A-Up> <C-u>

" key-combination to move to next/previous buffer and tab (<C-l> same as redraw!)
nnoremap <Leader>] :bn<CR>
nnoremap <Leader>[ :bp<CR>
nnoremap <Tab> :tabnext<Cr>
nnoremap <S-Tab> :tabprevious<Cr>

"splits the line after cursor and remain in normal mode
nnoremap <Leader><Enter> a<Enter><Esc>

"maps qq to <Esc>
"noremap qq <Esc>
"don't use this key combination for command line because it executes!
"inoremap qq <Esc>

"highlight all matches to search results
set hlsearch
" highlight match while still typing search pattern
set incsearch
" make default search ignore case
set ignorecase

"set viminfo like creams
"set viminfo='1000,f1,\"100,%,!,h,<500,:100,/100,s10
set viminfo='50,f1,\"100,h,<500,:100,/100,@100,s10
"set viminfo='0,:0,<0,@0,f0
set sessionoptions=blank,buffers,curdir,folds,resize,slash,unix,winpos,winsize,tabpages
"set sessionoptions=blank,buffers,curdir,folds,help,resize,slash,unix,winpos,winsize
"set sessionoptions=buffers,winpos,resize,slash,tabpages,unix
"Keep tesing what causes to save argadd and so unwanted buffers. If for some
"reason :args returns nonempty list, clear it with :argdel *

" Auto Load session for terminal/console vim 
if has("gui_running")
    autocmd VimEnter * nested call LoadSession()
    autocmd VimLeave * call SaveSession()
else
    autocmd VimEnter * call LoadTermSession()
    autocmd VimLeave * call SaveTermSession()
endif

function! SaveTermSession()
    execute 'argdel *'
    execute 'mksession! $HOME/termsession.vim'
endfunction

function LoadTermSession()
    if argc() == 0
        execute 'source $HOME/termsession.vim'
        execute 'filetype detect'
    endif
endfunction

function! SaveSession()
    execute 'argdel *'
    execute 'mksession! $HOME/session.vim'
endfunction

function LoadSession()
    if argc() == 0
        execute 'source $HOME/session.vim'
        execute 'filetype detect'
    endif
endfunction

"auto save/load view for some reason it caused me problems when set on!
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent loadview

"Create a sort of time stamp abbreviation:
iabbrev &date! <Esc>:r !date +\%F\ \%R\ \%a\ \%Z\%z<Enter>$a
" doesn't work with the formate, but :r !date works.

"Make vim save backup of the files: 
set backup
set backupcopy=auto
"And save in the first folder it can of the following:
"set backupdir=/run/media/zelhar/JetFlash16/backupvimtexts,~/tmp,~/temp,.,~/
"set backupdir=~/tmp,.,~/
set backupdir=/run/media/zelhar/UF16/backupvimtexts,
            \/run/media/zelhar/JetFlash16/backupvimtexts,~/tmp,~/temp,.,~/,
            \/media/JetFlash16

"disable autoclose brackets plugin. (I disabled the plugin due to annoyance.
"\a "I think I have removes it already. 

"add a dictionary file for word completion:
set dictionary+=/usr/share/dict/american
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/ngerman
set dictionary+=/usr/share/dict/spanish


"make autocomplete with ctrl-n search in the also in the dictionary
set complete+=k

"Set (locally) working dir to be the same as the file being edited in the buffer
autocmd BufEnter * silent! lcd %:p:h

"redraw screen when switching buffer, and returning to window (cleans garbage)  
autocmd BufEnter * :redraw!
autocmd FocusGained * :redraw! 
autocmd WinEnter * :filetype detect

"Testing Konsole cursor shape:
if (&term =~ "screen-256color" || &term=~"tmux-256")
    if $ISKONSOLE
        "checking for tmux first because it can run through different terminals
        "let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
        "let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        "This should work in urxvt and maybe xterm
        let &t_SI = "\ePtmux;\e\e[5 q\e\\"
        let &t_EI = "\ePtmux;\e\e[2 q\e\\"
        let &t_SR = "\ePtmux;\e\e[3 q\e\\"
    endif
elseif &term =~"xterm" && $ISKONSOLE
    "I set up the $ISKONSOLE env var in mykonsole profile
    let &t_SI = "\<Esc>]50;CursorShape=1;BlinkingCursorEnabled=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0;BlinkingCursorEnabled=0\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2;BlinkingCursorEnabled=1\x7"
"""elseif &term == "xterm" || &term == "xterm-256color" || &term=="xterm-256color-italic"
elseif &term =~ "xterm" && !$ISKONSOLE
    "let &t_EI = "\<Esc>]12;red\x7"
    "let &t_SI = "\<Esc>]12;orange\x7"
    "let &t_SI .= "\<Esc>[1 q"
    "let &t_EI .= "\<Esc>[2 q"
    "let &t_SR .= "\<Esc>[3 q"
    " 1 or 0 -> blinking block
    " 2 ->solid block
    " 3 -> blinking underscore
    " 4 ->solid underscore
    " Recent versions of xterm (282 or above) also support
    " 5 -> blinking vertical bar
    " 6 -> solid vertical bar  " solid underscore
    let &t_SI = "\<Esc>[5 q"
    " solid block
    let &t_EI = "\<Esc>[2 q"
    let &t_SR = "\<Esc>[3 q"
    " 1 or 0 -> blinking block
    " 3 -> blinking underscore
elseif &term =~ "rxvt" && !$ISKONSOLE
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[2 q"
    let &t_SR = "\<Esc>[3 q"
    " use an orange cursor in insert mode
    "let &t_SI = "\<Esc>]12;orange\x7"
    " use a red cursor otherwise
    "let &t_EI = "\<Esc>]12;red\x7"
    "silent !echo -ne "\033]12;red\007"
    " reset cursor when vim exits
    "autocmd VimLeave * silent !echo -ne "\033]112\007"
    " use \003]12;gray\007 for gnome-terminal
elseif &term =~ "nvim"
    "nothing to do yet

else
"    let &t_SI = "\e[?6;0;0c"
"    let &t_EI = "\e[?16;0;0c"
"    let &t_EI = "\<Esc>[6 q"
"    let &t_SR = "\e[?2;0;0c"

"    let &t_ti.="\e[1 q"
"    let &t_SI.="\e[5 q"
"    let &t_EI.="\e[1 q"
"    let &t_te.="\e[0 q"
    echo "unknown terminal 1"
endif
"To enable italic fonts on terminal:
"set t_ZH=[3m
"set t_ZR=[23m
"Or that way seems to work just as above without typing in special esc char:
"if &term =~"xterm" || &term =~ "screen" || &term =~ "tmux"
if &term =~ "xterm" || &term =~ "rxvt"
    let &t_ZH="\e[3m"
    let &t_ZR="\e[23m"
elseif &term =~ "screen" || &term =~ "tmux"
    let &t_ZH="\e[3m"
    let &t_ZR="\e[23m"
    "let &t_ZH="\ePtmux;\e\e[3m\e\\"
    "let &t_ZR="\ePtmux;\e\e[23m\e\\"
elseif &term =~ "nvim"
    "nothing to do yet
else
    echo "unknown terminal 2"
endif 

" Brace face
set showmatch

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
set mousehide		" Hide the mouse when typing text

set ch=2		" Make command line two lines high
set cursorline
"set cc=81

" Setting scrolloff so cursor alsways stays inside that range except the top/bot
set scrolloff=5

"Neovim stuff
if has('nvim')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

"set a shorter timeout for key-combs and commands (default=1000)
set timeoutlen=200

"set position for new split windows:
set splitbelow
set splitright

" Test section - temp changes
"let vim_markdown_preview_browser='google-chrome-beta'
"let vim_markdown_preview_temp_file=1
"let vim_markdown_preview_use_xdg_open=1
"let vim_markdown_preview_hotkey='<C-m>'
"let vim_markdown_preview_github=1
"vim-table-mode
let g:table_mode_corner = '|'

"trying to fix arrow keys in insert mode in VIM
"set t_ku=OA
"set t_kd=OB
"set t_kr=OC
"set t_kl=OD
imap OA <Esc>ki
imap OB <Esc>ji
imap OC <Esc>li
imap OD <Esc>hi

"disable spellcheck for help files
function NoSpellcheckForHelpFiles()
    if &filetype=="help"
        setlocal nospell
    else
        setlocal spell
    endif
endfunction
autocmd BufNewFile,BufRead,BufEnter *.markdown,*.md,*.mdown,*.mkd,*.mkdn,*.txt,*.info call NoSpellcheckForHelpFiles()
"airline/powerline stuff
let g:powerline_pycmd="py3"
"let g:airline_powerline_fonts = 1
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
"let g:airline#extensions#tabline#enabled = 1
"Turning off AutoClose only use it when I need to.
let g:AutoCloseOn = 0
"Setting bufferline to my liking
let g:bufferline_echo = 1
let g:bufferline_rotate = 1
let g:bufferline_fname_mod = ':t'
let g:bufferline_fixed_index =  1
"More Vim-airline settings
"Some more airline stuff- disable undesired plugin integration
"let g:airline#extensions#bufferline#enabled = 0
"let g:airline#extensions#branch#enabled = 1
