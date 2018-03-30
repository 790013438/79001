" 文件类型侦测

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
set ignorecase

" 关闭兼容模式
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu


" >>>>
" 插件安装

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe'
Plug 'altercation/vim-colors-solarized'
Plug 'thaerkh/vim-indentguides'
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'iCyMind/NeoSolarized'
Plug 'posva/vim-vue'

call plug#end()

filetype plugin indent on
" <<<<

colorscheme NeoSolarized
colorscheme gruvbox


" 禁止光标闪烁
set gcr=a:block-blinkon0

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

"toggle fullscreen mode by pressing f11
noremap <F11> <ESC>:call libcallnr('gvim_fullscreen.dll', 'ToggleFullscreen',0)<cr>
"toggle window transparency to 247 or 180 by pressing F12
noremap <F12> <ESC>:call libcallnr('gvim_fullscreen.dll', 'ToggleTransparency', "247,180")<cr>
"233

" 辅助信息

" 显示光标当前位置
set ruler

" 开启行号显示
set relativenumber
set number

" 高亮显示搜索结果
set hlsearch

" 其他美化

" 禁止折行
set nowrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" 语法分析

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" >>
" 缩进

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

set list

let g:indentguides_spacechar = '·'
let g:indentguides_tabchar = '|'
" >>
" 接口与实现快速切换

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

" 标签列表

" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签



" <<

" >>
" 代码导航

" 基于标签的代码导航

" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>

" 基于语义的代码导航

nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

" <<

" >>
" 查找

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>

" <<

" >>
" 内容替换

" 快捷替换
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'

" 精准替换
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
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
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" <<

" 模板补全
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" >>
" YCM 补全

" YCM 补全菜单配色
" 菜单
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#eee8d5 guibg=#6c71c4
" 选中项
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1

" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0

" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=0

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>

" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1

" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" <<

" >>
" 由接口快速生成实现框架

" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1



" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim

" 定义:Man命令查看各类man信息的快捷键
nmap <Leader>man :Man 3 <cword><CR>

" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>

" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>

" 设置环境保存项
set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

" 保存 undo 历史。必须先行创建 .undo_history/
" set undodir=~/.undo_history/
set undodir=D:\programming\gvim_8.0.0003_x64\vim/.undo_history/
set undofile

" 保存快捷键
"map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
map <leader>ss :mksession! my.vim<cr>

" 恢复快捷键
"map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>
map <leader>rs :source my.vim<cr>

" <<

" 设置快捷键实现一键编译及运行
nmap <Leader>m :wa<CR> :cd build/<CR> :!rm -rf main<CR> :!cmake CMakeLists.txt<CR>:make<CR><CR> :cw<CR> :cd ..<CR>
nmap <Leader>g :wa<CR>:cd build/<CR>:!rm -rf main<CR>:!cmake CMakeLists.txt<CR>:make<CR><CR>:cw<CR>:cd ..<CR>:!build/main<CR>

" >>
" 快速选中结对符内的文本

" 快捷键
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)

" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" <<

" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>
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
" 
"233

"=====[ Highlight matches when jumping to next ]=============

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>


" EITHER blink the line containing the match...
function! HLNext (blinktime)
    set invcursorline
    redraw
"       exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

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
