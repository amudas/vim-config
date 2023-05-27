set shortmess=alI
set rop=type:directx
set go=				"不显示图形按钮
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr
set fileencoding=utf-8
set nu
"set t_Co=256
set cc=80
"------字体设置（换字体不要删除行，注释掉就可以了）--------------start
"set guifont=YaHei\ Consolas\ Hybrid:h11.5
"set guifont=Monaco:h10.5	"修改字体
"set guifont=hack:h10.5
set guifont=Consolas:h11
"set guifont=Fira\ Code\ Retina:h11
"set guifont=DejaVu_Sans_Mono_for_Powerline:h10
"set guifont=Cascadia\ Code\ PL:h11.5
"set guifontwide=YouYuan:h10
set guifontwide=Sarasa\ Mono\ SC:h11
"------字体设置（换字体不要删除行，注释掉就可以了）--------------end
filetype plugin on
"colorscheme space-vim-dark "修改配色	
"colorscheme space-vim-dark "修改配色	
hi Comment cterm=italic
syntax enable			"语法高亮
set syn=syntax-type		"
set cul
set showcmd			"显示输入的命令
set autoindent			"自动缩进
set cindent			
set tabstop=4			"Tab键的宽度
set softtabstop=4		"统一缩进为4
set shiftwidth=4		
set showmatch			"高亮显示匹配的括号
set matchtime=1			"匹配括号高亮的时间（1/10秒）
set smartindent			"为C程序提供自动缩进
"set wildmode=list:longest	"命令行模式补全功能
:inoremap <C-CR> <end><CR>
:inoremap <S-CR> <end><CR>
:inoremap <C-;> <end>;
"set pythonthreedll=python311.dll
call plug#begin()
"let g:plug_url_format='https://git::@hub.nuaa.cf/%s.git'
let g:plug_url_format='https://git::@ghproxy.com/https://github.com/%s.git'
	Plug 'scrooloose/nerdtree' "目录管理
	Plug 'yegappan/taglist' "关键字跳转
	Plug 'itchyny/lightline.vim' "状态行,注意air-line会拖慢vim，不要装了
	Plug 'morhetz/gruvbox'  "主题
	Plug 'neoclide/coc.nvim',{'branch': 'release'} "补全
	Plug 'jiangmiao/auto-pairs' "自动括号
	"Plug 'Yggdroot/indentLine' "缩进线
	Plug 'luochen1990/rainbow' "彩虹括号
	Plug 'kshenoy/vim-signature' "标准插件
	Plug 'octol/vim-cpp-enhanced-highlight' "语法高亮
	Plug 'yegappan/taglist' "函数列表插件
	Plug 'dracula/vim', { 'as': 'dracula' } "主题
	Plug 'rakr/vim-one' "主题
	Plug 'puremourning/vimspector'	"调试相关插件
	"Plug 'lalitmee/cobalt2.nvim'
	"Plug 'joshdick/onedark.vim'
call plug#end()
autocmd vimenter * nested colorscheme gruvbox
autocmd vimenter * nested highlight CocMenuSel guibg=DarkGreen
"autocmd vimenter * nested hi cCustomFunc  gui=bold guifg=yellowgreen
"autocmd vimenter * nested hi cCustomClass gui=reverse guifg=#00FF00
set bg=dark
"下面设置斜体注释,放在最后，以免被其它覆盖
highlight Comment cterm=italic gui=italic

" 不要自动选中第一个选项。
set completeopt=menu,menuone,noselect

" 禁止在下方显示一些啰嗦的提示
set shortmess+=c
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name"    " 按照名称排序  
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
let Tlist_Compart_Format = 1    " 压缩方式  
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
autocmd FileType java set tags+=D:\tools\java\tags  
autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"设置tags  
set tags=tags  
"set autochdir 
"
"autocmd VimEnter * NERDTree
"--Python相关----启动bash------
""noremap <F3> : belowright vert term<cr> # 右端启动
""noremap <F4> :below terminal python %<cr>
tnoremap <C-n> <c-\><c-n> # 把bash转为normal模式
"---------------------------End

"------状态栏------------------
set laststatus=2            " 设置状态栏在倒数第2行
"let g:airline_powerline_fonts = 1
let g:airline_theme="molokai"
set statusline=%1*\%<%.50F\             "显示文件名和文件路径 (%<应该可以去掉)
""set statusline+=%=%2*\%y%m%r%h%w\ %*        "显示文件类型及文件状态
""set statusline+=%3*\%{&ff}\[%{&fenc}]\ %*   "显示文件编码类型
""set statusline+=%4*\ row:%l/%L,col:%c\ %*   "显示光标所在行和列
set statusline+=%5*\%3p%%\%*            "显示光标前文本所占总文本的比例
""hi User1 cterm=none ctermfg=25 ctermbg=0 
""hi User2 cterm=none ctermfg=208 ctermbg=0
""hi User3 cterm=none ctermfg=169 ctermbg=0
""hi User4 cterm=none ctermfg=100 ctermbg=0
""hi User5 cterm=none ctermfg=green ctermbg=0
"-----状态栏结束-------------

"-----F5一键编译stm32-----------
"map <F5> :call Build_STM32()<CR>
"func! Build_STM32()
"	"检测有没有打开文件
"	if &filetype == ''	
"		echo "请打开一个文件！"
"	"检测目录下有没有makefile
"	elseif filereadable('makefile')
"		exec "w" 
"		exec "belowright terminal compiledb make"
"		set nonu
"	else
"		echo "当前目录未找到makefile文件!"
"	endif
"endfunc
"-----F5一键编译结束---------
"-----F6一键下载stm32-----------
"map <F6> :call Download_STM32()<CR>
"func! Download_STM32()
"	if &filetype == ''
"		echo "请打开一个文件!"
"	elseif filereadable('ocd-down.cfg')
"		exec "w" 
"		exec "belowright terminal openocd -f ocd-down.cfg"
"		set nonu
"	else
"		echo "当前目录未找到可用的Openocd文件!"
"	endif
"endfunc
"-----F6一键下载结束---------
"-----F8刷新ctags-----------
"map <C-F5> :call Refurbish_Ctags()<CR>
"func! Refurbish_Ctags()
"	if &filetype == ''
"		echo "请打开一个文件!"
"	else
"		exec "belowright terminal ctags -R"
"		set nonu
"	endif
"endfunc
"-----F8刷新ctags---------
:nmap <space>e <Cmd>CocCommand explorer<CR>
:cd E:\
" 设置NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
hi VertSplit    term=reverse        cterm=reverse          gui=none             guibg=Grey10      guifg=Grey30

"进行版权声明的设置
"添加或更新头
map <F4> :call TitleDet()<cr>'s
function AddTitle()
    call append(0,"/*====================================")
    call append(1,"#")
    call append(2,"# Author: GQLee - hiend@126.com")
    call append(3,"# QQ : 270208879")
    call append(4,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(5,"# Filename: ".expand("%:t"))
    call append(6,"# Description: ")
    call append(7,"#")
    call append(8,"====================================*/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
"更新最近修改时间和文件名
function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute ""
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction
" Default is ARM debugging
" In the future, consider using https://github.com/embear/vim-localvimrc for
" project specific settings
let g:termdebugger = "arm-none-eabi-gdb"

"==========coc.nvim设置==============================================Start===="
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"==========coc.nvim设置==============================================End===="

"==========Leaderf设置==============================================Start===="
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
"==========Leaderf设置==============================================End===="
set path+=D:/SoftWare/mingw-w64/x86_64-7.3.0-posix-seh-rt_v5-rev0/mingw64/x86_64-w64-mingw32/include
winpos 550 300 "初始界面位置
set lines=45 columns=140

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle 彩虹括号配置

"let g:indentLine_enabled=1
"let g:indentLine_char='|'

" ConEmu
if !empty($ConEmuANSI)
    set termencoding=utf8
    set term=xterm
    set t_Co=256
    set notermguicolors
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    colorscheme gruvbox
endif 
"colorscheme dracula "修改配色	
set linespace=-1
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"let g:vimspector_enable_mappings = 'HUMAN'
