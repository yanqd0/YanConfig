" YanConfig Copyright (C) 2015 yanqd0@gmail.com
"
" This program comes with ABSOLUTELY NO WARRANTY under the terms of GPLv3.
" This is free software, and you are welcome to redistribute it under certain
" conditions; see the LISENSE in the root of this project.

filetype off                        " Vundle required!
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'       " let Vundle manage Vundle

" on vim-scripts
" for tags
Plugin 'taglist.vim'
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Use_Right_Window=1    "Tlist显示在右侧
let Tlist_Exit_OnlyWindow=1     "如果taglist是最后一个窗口，则退出vim
let Tlist_GainFocus_On_ToggleOpen=1     "TlistToggle打开后，焦点自动转到taglist窗口中
let Tlist_Close_On_Select=1     "选择后，自动关闭taglist窗口
let Tlist_Use_SingleClick=1     "鼠标单击，即可跳转

Plugin 'TaskList.vim'

Plugin 'Gundo'
nnoremap <Leader>u :GundoToggle<CR>

" for completion
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'

" for syntax color
"Plugin 'altercation/solarized'
"let g:solarized_menu=0

Plugin 'tomasr/molokai'
let g:molokai_original = 0
let g:rehash256 = 0

Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_indent_levels = 10
let g:indent_guides_auto_colors = 1

" for help windows
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_history = &history
let g:ctrlp_max_files = 30000
let g:ctrlp_max_depth = 8
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }
let g:ctrlp_mruf_max = 250
let g:ctrlp_lazy_update = 0
let g:ctrlp_show_hidden = 1

Plugin 'majutsushi/tagbar'
nmap <silent> <F7> :TagbarToggle<CR>

Plugin 'scrooloose/nerdtree'
nnoremap <silent> <F6> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2         "选中root即设置为当前目录
let NERDTreeQuitOnOpen=1        "打开文件时关闭树
let NERDTreeShowBookmarks=1     "显示书签
"let NERDTreeMinimalUI=1         "不显示帮助面板
let NERDTreeDirArrows=1         "目录箭头，1为显示箭头，0为传统+-|
"let NERDTreeWinPos=1            "窗口显示在右侧

Plugin 'scrooloose/nerdcommenter'

" for syntastic checking
Plugin 'scrooloose/syntastic'
nnoremap <silent> <F3> :SyntasticCheck<CR>
nnoremap <silent> <F4> :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" for move faster
Plugin 'Lokaltog/vim-easymotion'

" for cmd line
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim'}
"let g:Powerline_symbols="unicode"

Plugin 'bling/vim-airline'

" for Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"Plugin 'github/git-lfs'

" for golang
Plugin 'fatih/vim-go'
"Plugin 'nsf/gocode'

" for markdown
Plugin 'godlygeek/tabular'
Plugin 'junegunn/goyo.vim'

Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1   "关闭折叠

Plugin 'MikeCoder/markdown-preview.vim'
map <leader>m :MarkdownPreviewWithCustomCodeStyleCodeStyle GitHub monokai_sublime<CR>

" for esay input
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'

" for cvs
Plugin 'chrisbra/csv.vim'

" unknown
Plugin 'SirVer/ultisnips'

" Python
"Plugin 'klen/python-mode'
"Plugin 'pythoncomplete'

" Vimperator
Plugin 'superbrothers/vim-vimperator'

call vundle#end()
filetype plugin indent on           " Vundle required!
