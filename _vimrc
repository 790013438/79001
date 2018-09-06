" 关闭兼容模式
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" 提示js
set omnifunc=javascriptcomplete#CompleteJS
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
set ignorecase
set smartcase
set smartindent
set smarttab

" 不自动换行
set nowrap

" 插件安装

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
"Plug 'Valloric/YouCompleteMe'
Plug 'altercation/vim-colors-solarized'
Plug 'thaerkh/vim-indentguides'
Plug 'pangloss/vim-javascript'
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'iCyMind/NeoSolarized'
Plug 'posva/vim-vue'
Plug 'junegunn/vim-slash'
Plug 'chr4/nginx.vim'


call plug#end()

filetype plugin indent on

colorscheme NeoSolarized
"colorscheme gruvbox

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 显示光标当前位置
set ruler

" 开启行号显示
set relativenumber
set number

" 高亮显示搜索结果
set hlsearch

" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 20170512更改encoding
"Lang $ Encoding{{{
set fileencodings=utf8,gbk2312,gbk,gb18030,cp936
set encoding=utf8
set termencoding=utf8
set langmenu=cn.UTF-8
let $LANG = 'en_us.UTF-8'
"}}}


" Display all matching files when we tab complete
set wildmenu

""=====[ Highlight matches when jumping to next ]=============
"
"" This rewires n and N to do the highlighing...
"nnoremap <silent> n   n:call HLNext(0.4)<cr>
"nnoremap <silent> N   N:call HLNext(0.4)<cr>
"
"
"" EITHER blink the line containing the match...
"function! HLNext (blinktime)
"    set invcursorline
"    redraw
""       exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
"    set invcursorline
"    redraw
"endfunction

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

let g:indentguides_spacechar = '·'
let g:indentguides_tabchar = '|'

"====[ Make the 81st column stand out ]====================

" OR ELSE just the 81st column of wide lines...
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"let mapleader = ','
"The default leader is \, but a comma is much butter.

"---------------Mappings---------------"

"Make it easy to edit the Vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Make NERDTreeToogle easier to toggle.
nmap <M-1> :NERDTreeToggle<CR>
" 显示隐藏文件
let NERDTreeShowHidden=1

" 模糊搜索
nmap <M-2> :FZF<CR>
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"--------------- Personal highlighting ---------------"
"====[ :so $VIMRUNTIME/syntax/hitest.vim ]=============
"match ErrorMsg /^Error/
"match ErrorMsg /\%>81v.\+/
"match errorMsg /[^\t]\zs\t\+/
"match errorMsg /[\t]/
" Preventing errors caused by IP address
"match errorMsg /\(2[5][6-9]\|2[6-9][0-9]\|[3-9][0-9][0-9]\)[.][0-9]\{1,3\}[.][0-9]\{1,3\}[.][0-9]\{1,3\}\|[0-9]\{1,3\}[.]\(2[5][6-9]\|2[6-9][0-9]\|[3-9][0-9][0-9]\)[.][0-9]\{1,3\}[.][0-9]\{1,3\}\|[0-9]\{1,3\}[.][0-9]\{1,3\}[.]\(2[5][6-9]\|\2[6-9][0-9]|[3-9][0-9][0-9]\)[.][0-9]\{1,3\}\|[0-9]\{1,3\}[.][0-9]\{1,3\}[.][0-9]\{1,3\}[.]\(2[5][6-9]\|2[6-9][0-9]\|[3-9][0-9][0-9]\)/
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2

map <silent> <A-F2> :if &guioptions =~# 'T' <Bar>
     \set guioptions-=T <Bar>
     \set guioptions-=m <bar>
 \else <Bar>
     \set guioptions+=T <Bar>
     \set guioptions+=m <Bar>
 \endif<CR>

"------------------- Modifying tabs -------------------"
"function! ShortTabLine()
"    let ret = ''
"    for i in range(tabpagenr('$'))
"    " select the color group for highlighting active tab
"        if i + 1 == tabpagenr()
"            let ret .= '%#errorMsg#'
"        else
"            let ret .= '%#TabLine#'
"        endif
"        " find the buffername for the tablabel
"        let buflist = tabpagebuflist(i+1)
"        let winnr = tabpagewinnr(i+1)
"        let buffername = bufname(buflist[winnr – 1])
"        let filename = fnamemodify(buffername,':t')
"        " check if there is no name
"        if filename == ''
"            let filename = 'noname'
"        endif
"        " only show the first 6 letters of the name and
"        " .. if the filename is more than 8 letters long
"        if strlen(filename) >=8
"            let ret .= '['. filename[0:5].'..]'
"        else
"            let ret .= '['.filename.']'
"        endif
"    endfor
"    " after the last tab fill with TabLineFill and reset tab page #
"    let ret .= '%#TabLineFill#%T'
"    return ret
"endfunction
"set tabline=%!ShortTabLine()

"----------- gui tab tool tip -----------"
"function! InfoGuiTooltip()
"    "get widow count"
"    let wincount = tabpagewinnr(tabpagenr(), '$')
"    let bufferlist=''
"    "get name for active buffers in windows"
"    for i in tabpagebuflist()
"        let bufferlist .= '['.fnamemodify(bufname(i),':t').'] '
"    endfor
"    return bufname($).' windows: '.wincount.' ' .bufferlist ' '
"endfunction
"set guitabtooltip=%!InfoGuiTooltip()

set splitbelow
set splitright

nmap <M-p> :b
" ============ 在浏览器中打开当前文件  ============"
nnoremap <silent> <F5> :update<Bar>silent !start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "file://%:p"<CR>
" ============ 在文件夹中打开当前文件  ============"
map <silent> <F4> :silent !explorer %:p:h:gs?\/?\\\\\\?<CR>

" ============ 闪烁 ============"
if has('timers')
  " Blink 2 times with 50ms interval
  noremap <expr> <plug>(slash-after) 'zz'.slash#blink(2, 50)
endif

set cursorline
set cursorcolumn

"========= 折叠HTML ========="
set foldmethod=syntax
"========= 折叠Java ========="
" autocmd FileType java :set fmr=/**,*/ fdm=marker fdc=1
"set foldmethod=indent

"========= 提高性能 ========="
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256

set wildmode=list:longest,full

