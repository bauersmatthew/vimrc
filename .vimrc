:autocmd!

" looks
set guifont=Consolas:h11
colorscheme badwolf
" good ones: (elflord?) badwolf candycode (colorful256?) (custom?) (dante?) darkburn (darkzen?) (desert256?) 

" random shit
set nocompatible
set backspace=2
set number

" mappings
let mapleader = ","

" insert space in normal mode
nnoremap <space> a <esc>

" ctrl-back, del -> back, del 1 word
nnoremap <c-del> de
inoremap <c-del> <esc>dei
nnoremap <c-bs> madbw'a
inoremap <c-bs> <esc>madbw'ai

" saving
nnoremap <c-s> :w<cr>
inoremap <c-s> <esc>:w<cr>a

" reduce typo potential for quit
nnoremap :Q :q<cr>

" edit .vimrc (this)
let $MYVIMRC="~/.vimrc"
nnoremap <leader>rce :vsplit $MYVIMRC<cr>
nnoremap <leader>rcs :source $MYVIMRC<cr>

" left/top is dumb as fuck
set splitright
set splitbelow

" close current document
nnoremap <leader>c :bd<cr>
nnoremap <leader>cq :bd!<cr>

" delete document
nnoremap <leader>rm :! del 

" open documents
nnoremap <leader>o :vsp 
nnoremap <leader>oh :sp 
nnoremap <leader>ov :vsp 

" making o and O do the exact same thing as using returns
nnoremap o A<cr>
nnoremap O I<cr><esc>ka

" programming info headers
nnoremap <leader>pdate a<C-R>=strftime("%d %b %Y")<cr><esc>
nmap <leader>pih1 aFile: <c-r>%<esc>
nmap <leader>pih2 aEdited: <c-r>=strftime("%d %b %Y")<cr><esc>
nnoremap <leader>pih3 aAuthor: Matthew Bauer<esc>
nmap <leader>pihc :setlocal noautoindent<cr>:setlocal ft=none<cr>maggO<esc>O/*<cr> * <esc><leader>pih1o * <esc><leader>pih2o * <esc><leader>pih3o */<esc>'a:setlocal ft=c<cr>:setlocal autoindent<cr>
nmap <leader>pihcpp <leader>pihc:setlocal ft=cpp<cr>
nmap <leader>dsu ma3GfEd$<leader>pih2'a

" auto put in info headers
autocmd BufNewFile *.cpp :execute "normal ,pihcppG"
autocmd BufNewFile *.c :execute "normal ,pihcG"
autocmd BufNewFile *.h :execute "normal ,pihcpp6Gi#pragma once\<cr>\<esc>Gi"

" alternative way to exit insert mode
inoremap jk <esc>
inoremap JK <esc>

" arrow keys are bad!
inoremap <Up> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Down> <nop>
nnoremap <Up> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Down> <nop>

" switching partitions
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" make it so that files are saved on creation.
" autocmd BufNewFile * :w (DISABLED)

" insert semicolon without changing caret pos
nnoremap <leader>; maA;<esc>'a
inoremap <leader>; <esc>maA;<esc>'aa

" I don't see a reason to ever have syntax highlighting or indenting off.
filetype plugin on
autocmd BufAdd * :syntax on
autocmd BufAdd * :set autoindent
autocmd VimEnter * :syntax on
autocmd VimEnter * :set autoindent
autocmd BufNewFile * :syntax on
autocmd BufNewFile * :set autoindent

" check indentation
nnoremap <leader>i magg=G'a

" I type stD like half the time.
ab stD std

" omaps
onoremap np :<c-u>normal! f(vi(<cr>
onoremap lp :<c-u>normal! F)vi(<cr>
onoremap nq :<c-u>normal! f"vi"<cr>
onoremap lq :<c-u>normal! F"vi"<cr>
onoremap na :<c-u>normal! f<vi<<cr>
onoremap la :<c-u>normal! F>vi<<cr>
onoremap ns :<c-u>normal! f[vi[<cr>
onoremap ls :<c-u>normal! F]vi[<cr>

" inserting 2 lines above is hard
nmap <leader>ll O<esc>O
nmap <leader>nn o<cr>
nmap <leader>mm o<esc>O

" auto create matching brackets
inoremap {<cr> {<cr><tab>t<cr><bs>}<esc>k$xA

" auto create function def headers
nmap <leader>ch 0y$Go<esc>p0f;xo{
nmap <leader>chn ma<leader>ch<esc>'a

" from auto create brackets, exiting them is a bit hard.
nmap <leader>es jo

" file operations
nnoremap <leader>mkd :!mkdir 
nnoremap <leader>fcp :!cp 
nnoremap <leader>fmv :!ren 
nnoremap <leader>frm :!del

" analog to :cd
nnoremap <leader>cd :cd 
nnoremap <leader>gcd :cd<cr>

" list files
nnoremap <leader>ls :!dir<cr>

" quick todo
nnoremap <leader>todo a// TODO: 

" stop vim from deleting indentation on empty lines
inoremap <cr> <cr>x<bs>
nmap o A<cr>
nnoremap O I<cr><up>x<bs>

" creating new lines without exiting normal mode
nmap <cr> o<esc>
nmap <c-cr> O<esc>

" comment markers (C)
nnoremap <leader>pmi A/* includes */<esc>
nnoremap <leader>pmg A/* globals */<esc>
nnoremap <leader>pmc A/* classes */<esc>
nnoremap <leader>pml A/* function declarations */<esc>
nnoremap <leader>pmd A/* function definitions */<esc>
nnoremap <leader>pmm A/* con/de-structors */<esc>
nnoremap <leader>pmp A/* public functions */<esc>
nnoremap <leader>pmr A/* private functions */<esc>
nnoremap <leader>pma A/* macros */<esc>

" put in /* */ comment
nnoremap <leader>csc A/*  */<left><left><left>

" make cap commands the same as lowercase
imap JK jk
nnoremap H h
nnoremap J j
nnoremap K k
nnoremap L l
