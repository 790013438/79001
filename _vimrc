" vim8.0开始的默认vim，patch 7.4.2111
unlet! skip_defaults_vim
" 不用msvim
let g:skip_loading_mswin=1
source $VIMRUNTIME/defaults.vim

" 视情况缩进
"set smartindent
"set smarttab

" 增减字母
"set nrformats+=alpha

" 插件安装

call plug#begin('~/.vim/plugged')
""Plug 'Valloric/YouCompleteMe'
""Plug 'chrisbra/matchit'
""Plug 'jnurmine/Zenburn'
""Plug 'morhetz/gruvbox'
""Plug 'pangloss/vim-javascript'
""Plug 'vim-scripts/vim-javacomplete2'
""Plug 'altercation/vim-colors-solarized'
""Plug 'chr4/nginx.vim'
""Plug 'iCyMind/NeoSolarized'
""Plug 'junegunn/vim-slash'
""Plug 'scrooloose/nerdtree'
Plug 'kshenoy/vim-signature'
""Plug 'vim-scripts/ShowMarks'
""Plug 'jacquesbh/vim-showmarks'
Plug 'NLKNguyen/papercolor-theme'
Plug 'bartlomiejdanek/vim-dart'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'posva/vim-vue'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'thaerkh/vim-indentguides'
call plug#end()


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

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

exec "set listchars=tab:>-,trail:\uB7,nbsp:~"
set list

" 设置缩进对齐符号
let g:indentguides_spacechar = '·'
let g:indentguides_tabchar = '|'

"====[ Make the 81st column stand out ]====================
" OR ELSE just the 81st column of wide lines...
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

"Make it easy to edit the Vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>


"--------------- Personal highlighting ---------------"
"====[ :so $VIMRUNTIME/syntax/hitest.vim ]=============
"match ErrorMsg /^Error/
"match ErrorMsg /\%>81v.\+/
"match errorMsg /[^\t]\zs\t\+/
"match errorMsg /[\t]/
" Preventing errors caused by IP address
"match errorMsg /\(2[5][6-9]\|2[6-9][0-9]\|[3-9][0-9][0-9]\)[.][0-9]\{1,3\}[.][0-9]\{1,3\}[.][0-9]\{1,3\}\|[0-9]\{1,3\}[.]\(2[5][6-9]\|2[6-9][0-9]\|[3-9][0-9][0-9]\)[.][0-9]\{1,3\}[.][0-9]\{1,3\}\|[0-9]\{1,3\}[.][0-9]\{1,3\}[.]\(2[5][6-9]\|\2[6-9][0-9]|[3-9][0-9][0-9]\)[.][0-9]\{1,3\}\|[0-9]\{1,3\}[.][0-9]\{1,3\}[.][0-9]\{1,3\}[.]\(2[5][6-9]\|2[6-9][0-9]\|[3-9][0-9][0-9]\)/
set statusline=[FORMAT=%{&ff}]\ [TYPE=%y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2
if has("statusline")
    set statusline+=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
 endif

map <silent> <A-F2> :if &guioptions =~# 'T' <Bar>
     \set guioptions-=T <Bar>
     \set guioptions-=m <bar>
 \else <Bar>
     \set guioptions+=T <Bar>
     \set guioptions+=m <Bar>
 \endif<CR>

set splitbelow
set splitright

" ============ 在浏览器中打开当前文件  ============"
nnoremap <silent> <F5> :update<Bar>silent !start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "file://%:p"<CR>
" ============ 在文件夹中打开当前文件  ============"
map <silent> <F4> :silent !explorer %:p:h:gs?\/?\\\\\\?<CR>

" ============ 查找时闪烁 ============"
if has('timers')
  " Blink 2 times with 50ms interval
  noremap <expr> <plug>(slash-after) 'zz'.slash#blink(2, 50)
endif

"========= 折叠HTML ========="
set foldmethod=manual
set foldlevelstart=99

"========= 提高性能 ========="
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap gc <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap gc <Plug>(EasyAlign)

" fzf
set rtp+=C:/ProgramData/chocolatey/lib/fzf/tools
set rtp+=C:/ProgramData/chocolatey/bin
set rtp+=~/.fzf
augroup fzf
  autocmd!
augroup END

" 模糊搜索
nmap <M-2> :FZF<CR>
" Key mapping
" History of file opened
nnoremap <leader>h :History<cr>
" Buffers opens
nnoremap <leader>b :Buffers<cr>
" Files recursively from pwd
nnoremap <leader>f :Files<cr>
nnoremap <leader>r :Rgi<space><cr>

"" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" ripgrep command to search in multiple files
autocmd fzf VimEnter * command! -nargs=* Rg
  \ call fzf#vim#Ag(
  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" ripgrep - ignore the files defined in ignore files (.gitignore...)
autocmd fzf VimEnter * command! -nargs=* Rgi
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" ripgrep - ignore the files defined in ignore files (.gitignore...) and doesn't ignore case
autocmd fzf VimEnter * command! -nargs=* Rgic
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" ripgrep - ignore the files defined in ignore files (.gitignore...) and doesn't ignore case
autocmd fzf VimEnter * command! -nargs=* Rgir
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" ripgrep - ignore the files defined in ignore files (.gitignore...) and doesn't ignore case and activate regex search
autocmd fzf VimEnter * command! -nargs=* Rgr
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --hidden --no-ignore --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

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

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-b': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }

nnoremap <Leader>gf :Rgi <C-R><C-W><CR>

" 保存后也可以撤销
set writebackup
set backupcopy=no
" 当移到最右边时，展示遮挡的字符
set sidescroll=10
" 移动到其他文件时，自动保存
set autowrite
" 设置尝试的文本格式
set fileformats=unix,dos
" 设置建议推断大小写
set infercase

" 添加session
set sessionoptions+=resize,unix,slash
" 设置书签记录
set viminfo='1000,f1

" 注释
iabbrev #b /****************************************
iabbrev #e <Space>****************************************/

" 设置格式 合并行时，去除注释
set formatoptions=croqlnmMj

" java提示代码
if has("autocmd")
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
endif

" sql启用语法高亮
let g:sql_type_default = 'sqlanywhere'

" vue配置模板
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.vue 0r ~/.vim/templates/skeleton.vue
  augroup END
endif


" http://vimdoc.sourceforge.net/htmldoc/starting.html#vimrc

"set nocompatible        " use vim defaults
set scrolloff=3         " keep 3 lines when scrolling
set ai                  " set auto-indenting on for programming

set showcmd             " display incomplete commands
set nobackup            " do not keep a backup file
set number              " show line numbers
set ruler               " show the current row and column

set hlsearch            " highlight searches
set incsearch           " do incremental searching
set showmatch           " jump to matches when entering regexp
set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present

set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

set backspace=indent,eol,start  " make that backspace key work the way it should
"set runtimepath=$VIMRUNTIME     " turn off user scripts, https://github.com/igrigorik/vimgolf/issues/129

syntax on               " turn syntax highlighting on by default
filetype on             " detect type of file
filetype indent on      " load indent file for specific file type

set t_RV=               " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282
silent! vunmap <C-X>
silent! unmap Q
vmap <C-Del> <Nop>
vmap <S-Del> <Nop>
vmap <C-Insert> <Nop>
vmap <S-Insert> <Nop>
map <S-Insert> <Nop>
set nosmartindent
set noautoindent

let g:netrw_liststyle = 3

au BufNewFile,BufRead *.sql   set sw=2

