call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'valloric/youcompleteme'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/winmanager'
Plug 'skywind3000/asyncrun.vim'
Plug 'shougo/echodoc'
call plug#end()

let mapleader=","

"设置编码
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,ucs-bom,chinese

"语言设置
set langmenu=zh_CN.UTF-8

"设置行号
set nu
set relativenumber


"设置语法高亮
syntax enable
syntax on

"设置配色方案
"colorscheme  desert

"可以在buffer的任何地方使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"高亮显示匹配的括号
set showmatch

"去掉vi一致性
set nocompatible

"文件自动检测外部更改
set autoread
"高亮查找匹配
set hlsearch


"设置缩进
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"set autoindent
"set cindent
"set smartindent 
"set smarttab

autocmd BufNewFile *.cc,*.cpp,*.c,*.h exec ":call SetTitleC()"  
"新建.cc,.cpp,.c,  
"定义函数SetTitle，自动插入文件头  
func SetTitleC()  
	call setline(1, "/*===============================================================")  
	call setline(2, "\ @Author: jianglei")  
	call setline(3, "\ @Created Time : ".strftime("%c"))  
	call setline(4, "")   
	call setline(5, "\ @File Name: ".expand("%"))  
	call setline(6, "\ @Description:")  
	call setline(7, "")   
	call setline(8, "================================================================*/")  
	call setline(9,"")  
    if expand("%:e") == 'c'  
		call setline(10,"#include <stdio.h>")  
		call setline(11,"int main(int argc, char ** argv) {")  
		call setline(12,"")  
		call setline(13,"  return 0;")  
		call setline(14,"}")  
	elseif expand("%:e") == 'h' 
		call setline(10, "#pragma once") 
		call setline(11, "") 
    elseif (expand("%:e") == 'cpp') || (expand("%:e") == 'cc')  
		call setline(10,"#include <iostream>")  
		call setline(11,"int main(int argc, char ** argv) {")  
		call setline(12,"")  
		call setline(13,"  return 0;")  
		call setline(14,"}")  
    endif  
endfunc  

"设置tagbar,NerdTree快捷键
nmap <F8> :TagbarToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>
"YouCompleteMe
""配置默认文件路径
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
noremap <c-z> <NOP>
let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }


"ale
""始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
""普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
""打开文件时不进行检查
let g:ale_lint_on_enter = 0
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

"winmanager
let g:winManagerWindowLayout='NERDTree|Tagbar'
let g:winManagerWidth=30
let g:AutoOpenWinManager = 1
let g:NERDTree_title = "[NERDTree]"
function! NERDTree_Start()
    exe 'q' "执行一个退出命令，关闭自动出现的窗口"
    exe 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
let g:Tagbar_title = "[Tagbar]"
function! Tagbar_Start()
    exe 'q' "执行一个退出命令，关闭自动出现的窗口"
    exe 'TagbarOpen'
endfunction
function! Tagbar_IsValid()
    return 1
endfunction
let g:tagbar_vertical = 15

" To use echodoc, you must increase 'cmdheight' value.
set cmdheight=2
let g:echodoc_enable_at_startup = 1
