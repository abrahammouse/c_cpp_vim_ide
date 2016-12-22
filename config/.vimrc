" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================

let mapleader=";"

filetype on
filetype plugin on
syntax enable
syntax on
filetype indent on

nmap LB 0
nmap LE $
vnoremap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>
nnoremap nw <C-W><C-W>
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>jw <C-W>j
nmap <Leader>M %
" Automatically reload vimrc
"autocmd BufWritePost $MYVIMRC source $MYVIMRC
set incsearch
set ignorecase
set nocompatible
set wildmenu

call plug#begin('~/.vim/plugged')

Plug 'tomasr/molokai'
Plug 'vim-scripts/phd'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'derekwyatt/vim-fswitch'
Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indexer.tar.gz'
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/DrawIt'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'derekwyatt/vim-protodef'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'fholgado/minibufexpl.vim'
Plug 'gcmt/wildfire.vim'
Plug 'sjl/gundo.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'suan/vim-instant-markdown'
Plug 'lilydjwg/fcitx.vim'
" Terminal Vim with 256 colors colorscheme
Plug 'fisadev/fisa-vim-colorscheme'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

set background=dark
set gcr=a:block-blinkon0
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
map <silent> <F11> :call ToggleFullscreen()<CR>
set laststatus=2
set ruler
set number
set cursorline
set cursorcolumn
set hlsearch
set guifont=YaHei\ Consolas\ Hybrid\ 10.5
set nowrap
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
nmap <silent> <Leader>i <Plug>IndentGuidesToggle
set foldmethod=syntax
set nofoldenable
nmap <silent> <Leader>sw :FSHere<cr>

let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

let tagbar_left=1
nnoremap <Leader>ilt :TagbarToggle<CR>
let tagbar_width=32
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
     \ 'ctagstype' : 'c++',
     \ 'kinds'     : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>sp :CtrlSF<CR>
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'

function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction

nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=0
inoremap <leader>; <C-x><C-o>
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:disable_protodef_sorting=1

source $VIMRUNTIME/ftplugin/man.vim

nmap <Leader>man :Man 3 <cword><CR>

nmap <Leader>z :NERDTreeToggle<CR>
let NERDTreeWinSize=22
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

map <Leader>bl :MBEToggle<cr>
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>

set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
set undodir=~/.undo_history/
set undofile
map <leader>ss :mksession! my.vim<cr>
map <leader>rs :source my.vim<cr>
nmap <Leader>m :wa<CR> :cd build/<CR> :!rm -rf main<CR> :!cmake CMakeLists.txt<CR>:make<CR><CR> :cw<CR> :cd ..<CR>
nmap <Leader>g :wa<CR>:cd build/<CR>:!rm -rf main<CR>:!cmake CMakeLists.txt<CR>:make<CR><CR>:cw<CR>:cd ..<CR>:!build/main<CR>
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)

let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]
nnoremap <Leader>ud :GundoToggle<CR>

" Colorscheme -------------------------
" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
	let &t_Co = 256
    colorscheme fisa
else
    colorscheme delek
endif

" colors for gvim
if has('gui_running')
    colorscheme wombat
endif

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0
