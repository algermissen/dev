




"       HOW TO DO 90% OF WHAT PLUGINS DO (WITH JUST VIM)

"                          Max Cantor

"               NYC Vim Meetup -- August 3, 2016











" FEATURES TO COVER:
" - Fuzzy File Search
" - Tag jumping
" - Autocomplete
" - File Browsing
" - Snippets
" - Build Integration (if we have time)










" GOALS OF THIS TALK:
" - Increase Vim understanding
" - Offer powerful options

" NOT GOALS OF THIS TALK:
" - Hate on plugins
" - Get people to stop using plugins


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" {{{ BASIC SETUP
" BASIC SETUP:

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on









" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags





" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list





" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings



" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)









" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back





"                          THANK YOU!

"                    Download this file at:
"                github.com/mcantor/no_plugins

"                Follow me for kitten pictures:
"                     twitter.com/mcantor

"          Contact me at `max at maxcantor dot net` for:
"                  - Consulting (Dev and PM)
"                          - Tutoring
"                     - Classroom Teaching
"                     - Internal Training
"                       - Encouragement

" ============================================================================
" My personal settings
" ============================================================================


" MISCELLANEOUS SETTINGS
" -------------------------------------------------------------------

set encoding=utf-8
set tabstop=4
set expandtab
set ruler
set ffs=unix,dos,mac
set colorcolumn=80
set number
set numberwidth=3
set shiftwidth=4

" Configure statusline
set showcmd
set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%*

" Enable mouse positioning and copy/paste
set mouse=r


" CONFIGURE NERDTREE
" -------------------------------------------------------------------

map <C-n> :NERDTreeToggle<CR>
" https://superuser.com/questions/195022/vim-how-to-synchronize-nerdtree-with-current-opened-tab-file-path
map <leader>r :NERDTreeFind<cr>

" WE NOW CAN:
" - Open NERDTree with CTRL-n
" - Use \r to open NERDTree root at directory of current buffer

" WINDOW AND TAB HANDLING
" -------------------------------------------------------------------

" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" WE CAN NOW
" - Move around panes using CTRL + hjkl
" - Have new panes open below or rigth


" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" WE CAN NOW
" - Move to tab i by typing \i


"  SETTING UP RUST IDE
" -------------------------------------------------------------------

" Setting up shortcuts for commands in asyncomplete
" https://github.com/prabirshrestha/vim-lsp#supported-commands
map <leader>d :LspDefinition<cr>
map <leader>h :LspHover<cr>
map <leader>u :LspReferences<cr>
map <leader>f :LspDocumentFormat<cr>


" Configure for ctags navigation (rusty-tags)
" https://github.com/dan-t/rusty-tags

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWrite *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" <bar> redraw!

" WE CAN NOW
" - navigate to definition with CTRL+]
" - navigate back step wise with CTRL+t 


" Configure asynccomplete
" https://github.com/prabirshrestha/asyncomplete.vim
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" WE CAN NOW
" - navigate suggestions with tabs and select with return

" Configure easy comment/uncomment
" Seen in https://stackoverflow.com/a/14692524/267196
vnoremap <silent> / :s/^/\/\//<cr>:noh<cr>
vnoremap <silent> ? :s/^\s\+\/\///<cr>:noh<cr>

" WE CAN NOW
" - select lines with CTRL+V and comment block with /
" - select lines with CTRL+V and uncomment block with /

" Setup build and test shortcuts
map <leader>b :!cargo build<cr>
map <leader>t :!cargo test -- --nocapture<cr>

" WE CAN NOW
" - run build with \b
" - run test with \t

" Configure save hooks
let g:rustfmt_autosave = 1
" Use one these if you want to auto-build or test on save
" :autocmd BufWritePost <buffer> !cargo test -- --nocapture
" :autocmd BufWritePost *.rs !cargo test -- --nocapture
" :autocmd BufWritePost *.rs !cargo build

" SETTING UP PLUGINS
" -------------------------------------------------------------------

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'keremc/asyncomplete-racer.vim'
call plug#end()

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

" Added as said in https://github.com/keremc/asyncomplete-racer.vim#installation
autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#racer#get_source_options())

