" �ļ��������

" �����ļ��������
filetype on
" ������⵽�Ĳ�ͬ���ͼ��ض�Ӧ�Ĳ��
filetype plugin on

" ����ʵʱ��������
set incsearch

" ����ʱ��Сд������
set ignorecase

" �رռ���ģʽ
set nocompatible

" vim ����������ģʽ���ܲ�ȫ
set wildmenu


" >>>>
" �����װ

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe'
Plug 'altercation/vim-colors-solarized'

call plug#end()

filetype plugin indent on
" <<<<

" ��ɫ����
if has('gui_running')
    set background=light
else
    set background=dark
endif

colorscheme solarized
"colorscheme gruvbox
"colorscheme molokai
"colorscheme phd

" ��ֹ�����˸
set gcr=a:block-blinkon0

" ��ֹ��ʾ������
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" ��ֹ��ʾ�˵��͹�����
set guioptions-=m
set guioptions-=T

"toggle fullscreen mode by pressing f11
noremap <F11> <ESC>:call libcallnr('gvim_fullscreen.dll', 'ToggleFullscreen',0)<cr>
"toggle window transparency to 247 or 180 by pressing F12
noremap <F12> <ESC>:call libcallnr('gvim_fullscreen.dll', 'ToggleTransparency', "247,180")<cr>
"233

" ������Ϣ

" ������ʾ״̬��
set laststatus=2

" ��ʾ��굱ǰλ��
set ruler

" �����к���ʾ
set relativenumber

" ������ʾ��ǰ��/��
set cursorline
set cursorcolumn

" ������ʾ�������
set hlsearch

" ��������

" ���� gvim ��ʾ����
"set guifont=Inconsolata,Courier\ new,YaHei,Consolas,Hybrid:10
set guifont=Courier_new:h10,Consolas:h11

" ��ֹ����
set nowrap

" ����״̬��������
let g:Powerline_colorscheme='solarized256'

" �﷨����

" �����﷨��������
syntax enable
" ������ָ���﷨������ɫ�����滻Ĭ�Ϸ���
syntax on

" >>
" ����

" ����Ӧ��ͬ���Ե���������
filetype indent on

" ���Ʊ����չΪ�ո�
set expandtab
" ���ñ༭ʱ�Ʊ��ռ�ÿո���
set tabstop=4
" ���ø�ʽ��ʱ�Ʊ��ռ�ÿո���
set shiftwidth=4
" �� vim �����������Ŀո���Ϊһ���Ʊ��
set softtabstop=4

" >>
" �ӿ���ʵ�ֿ����л�

" *.cpp �� *.h ���л�
nmap <silent> <Leader>sw :FSHere<cr>

" ��ǩ�б�

" ���� tagbar �Ӵ��ڵ�λ�ó��������༭�������
let tagbar_left=1
" ������ʾ�����ر�ǩ�б��Ӵ��ڵĿ�ݼ����ټǣ�identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR>
" ���ñ�ǩ�Ӵ��ڵĿ��
let tagbar_width=32
" tagbar �Ӵ����в���ʾ���������Ϣ
let g:tagbar_compact=1
" ���� ctags ����Щ�����ʶ�����ɱ�ǩ



" <<

" >>
" ���뵼��
 
" ���ڱ�ǩ�Ĵ��뵼��

" ���ò�� indexer ���� ctags �Ĳ���
" Ĭ�� --c++-kinds=+p+l����������Ϊ --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
" Ĭ�� --fields=+iaS ������ YCM Ҫ�����Ϊ --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" �������ͬ����ǩ
nmap <Leader>tn :tnext<CR>
" �������ͬ����ǩ
nmap <Leader>tp :tprevious<CR>

" ��������Ĵ��뵼��

nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" ֻ���� #include ���Ѵ򿪵��ļ�
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

" <<

" >>
" ����

" ʹ�� ctrlsf.vim ����ڹ�����ȫ�ֲ��ҹ�����ڹؼ��֣����ÿ�ݼ�����ݼ��ټǷ���search in project
nnoremap <Leader>sp :CtrlSF<CR>

" <<

" >>
" �����滻

" ����滻
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'

" ��׼�滻
" �滻����������˵����
" confirm���Ƿ��滻ǰ��һȷ��
" wholeword���Ƿ�����ƥ��
" replace�����滻�ַ���
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
" ��ȷ�ϡ�������
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" ��ȷ�ϡ�����
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" ȷ�ϡ�������
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" ȷ�ϡ�����
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

" <<

" ģ�岹ȫ
" UltiSnips �� tab ���� YCM ��ͻ�������趨
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" >>
" YCM ��ȫ

" YCM ��ȫ�˵���ɫ
" �˵�
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" ѡ����
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900

" ��ȫ������ע����ͬ����Ч
let g:ycm_complete_in_comments=1

" ���� vim ���� .ycm_extra_conf.py �ļ���������ʾ
let g:ycm_confirm_extra_conf=0

" ���� YCM ��ǩ��ȫ����
let g:ycm_collect_identifiers_from_tags_files=0

" YCM ���� OmniCppComplete ��ȫ���棬�������ݼ�
inoremap <leader>; <C-x><C-o>

" ��ȫ���ݲ��Էָ��Ӵ�����ʽ���֣�ֻ��ʾ��ȫ�б�
set completeopt-=preview

" �ӵ�һ�������ַ��Ϳ�ʼ����ƥ����
let g:ycm_min_num_of_chars_for_completion=1

" ��ֹ����ƥ���ÿ�ζ���������ƥ����
let g:ycm_cache_omnifunc=0

" �﷨�ؼ��ֲ�ȫ
let g:ycm_seed_identifiers_with_syntax=1

" <<
 
" >>
" �ɽӿڿ�������ʵ�ֿ��

" ��Ա������ʵ��˳��������˳��һ��
let g:disable_protodef_sorting=1


 
" ����:Man����鿴����man��Ϣ
source $VIMRUNTIME/ftplugin/man.vim

" ����:Man����鿴����man��Ϣ�Ŀ�ݼ�
nmap <Leader>man :Man 3 <cword><CR>

" <<

" >>
" �����ļ����

" ʹ�� NERDTree ����鿴�����ļ������ÿ�ݼ����ټǣ�file list
nmap <Leader>fl :NERDTreeToggle<CR>
" ���� NERDTree �Ӵ��ڿ��
let NERDTreeWinSize=22
" ���� NERDTree �Ӵ���λ��
let NERDTreeWinPos="right"
" ��ʾ�����ļ�
let NERDTreeShowHidden=1
" NERDTree �Ӵ����в���ʾ���������Ϣ
let NERDTreeMinimalUI=1
" ɾ���ļ�ʱ�Զ�ɾ���ļ���Ӧ buffer
let NERDTreeAutoDeleteBuffer=1

" <<

" >>
" ���ĵ��༭
 
" ��ʾ/���� MiniBufExplorer ����
map <Leader>bl :MBEToggle<cr>

" buffer �л���ݼ�
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>

" <<


" >>
" �����ָ�

" ���û���������
set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

" ���� undo ��ʷ���������д��� .undo_history/
" set undodir=~/.undo_history/
set undodir=D:\programming\gvim_8.0.0003_x64\vim/.undo_history/
set undofile

" �����ݼ�
"map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
map <leader>ss :mksession! my.vim<cr>

" �ָ���ݼ�
"map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>
map <leader>rs :source my.vim<cr>

" <<
 
" ���ÿ�ݼ�ʵ��һ�����뼰����
nmap <Leader>m :wa<CR> :cd build/<CR> :!rm -rf main<CR> :!cmake CMakeLists.txt<CR>:make<CR><CR> :cw<CR> :cd ..<CR>
nmap <Leader>g :wa<CR>:cd build/<CR>:!rm -rf main<CR>:!cmake CMakeLists.txt<CR>:make<CR><CR>:cw<CR>:cd ..<CR>:!build/main<CR>

" >>
" ����ѡ�н�Է��ڵ��ı�
 
" ��ݼ�
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)

" ��������Щ��Է�
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" <<

" ���� gundo ��
nnoremap <Leader>ud :GundoToggle<CR>
" 20170512����encoding
"Lang $ Encoding{{{
set fileencodings=utf8,gbk2312,gbk,gb18030,cp936
set encoding=utf8
set langmenu=zh_CN.UTF-8
let $LANG = 'en_us.UTF-8'
language message zh_CN.GBK
"}}}


"2
"Youcompleteme fix
let g:ycm_global_ycm_extra_conf = 'D:\programming\gvim_8.0.0003_x64\vim\vimfiles\bundle\YouCompleteMe\third_party\ycmd\cpp\ycm/.ycm_extra_conf.py'
"233

"2
" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+='D:\File\Java_workspace'

" Display all matching files when we tab complete
set wildmenu
" 
"233
