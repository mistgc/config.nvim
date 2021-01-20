"My Vim/Neovim Preferance
"Add Parentheses function
function! CopyX()
		if(col("v")>col("."))
				let l1 = col(".")
				let l2 = col("v")
		else
				let l1 = col("v")
				let l2 = col(".")
		endif
		call setreg('x',getline(".")[l1-1:l2-1])
		return ''
endfunction
vnoremap <expr><C-l> CopyX()."c"
		\ .Addparentheses(getchar())."<Esc>"
function! Addparentheses(n)
		if a:n == 123
				return "{".getreg('x')."}"
		elseif a:n == 40
				return "(".getreg('x').")"
		elseif a:n == 91
				return "[".getreg('x')."]"
		elseif a:n == 34
				return "\"".getreg('x')."\""
		endif
endfunction
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
"使golang中的func等高亮
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"disable warning:"vim-go: initialized gopls""
let g:go_gopls_enabled = 0

set nocompatible "不使用兼容模式
set nu "显示行号
syntax on "语法高亮
set ruler "显示标尺
set showcmd "出入的命令显示出来，看的清楚些
set scrolloff=3 "光标移动到buffer的顶部和底部时保持3行距离
set laststatus=2 "总是显示状态行
set noeb "去掉输入错误的提示声音
set autoindent "自动缩进
set relativenumber "相对行号
set noundofile
set nobackup
set noswapfile
syntax enable
colorscheme one
set t_Co=256
set expandtab "(是否在缩进和遇到 Tab 键时使用空格替代;使用 noexpandtab 取消设置)
set tabstop=4 "用多少个空格来显示一个制表符，只是用来显示。
set softtabstop=4 "(软制表符宽度,设置为非零数值后使用 Tab 键和 Backspace 时光标移动的格数等于该数值,但实际插入的字符仍受 tabstop 和 expandtab 控制);
"一般不要使用该设置 或 使该值等于你想要的一个制表符的宽度
"set shiftwidth=4 "指用>>或<<进行缩进的空格数,例如set
"shiftwidth=20,再按>>就向左移动20个空格的距离.
""这20个空格的距离是用tabstop来转换的,例如tabstop=5,那按>>的结果就是用4个tab来填充.
set hls "高亮显示搜索结果 等同于 set hlsearch
set showmatch "高亮显示匹配的括号
set whichwrap+=<,>,h,l "允许backspace和光标键跨越行边界
"set cursorline "在光标当先行底部显示一条线，以标识出当前光标所在行
""set mouse=a "鼠标总是可用
set showcmd
set wildmenu
set smartindent "暂时还不清楚做什么用的
"set encoding=utf-8
""这个目前还不确定需不需要配置，该怎么配置，这是VIM内部使用的编码方式
"set fileencoding=utf-8 "不需要配置
"Vim启动时会按照它所列出的字符编码方式逐一探测即将打开的文件的字符编码方式，并且将 fileencoding 设置为最终探测到的字符编码方式
set fileencodings=ucs-bom,utf-8,gbk "这里很重要，这一行表示vim编码格式依次选择
"解释:加入GBK,可支持GBK编码的
set ignorecase "搜索时忽略大小写
set cindent "使用C样式的缩进
autocmd FileType make set noexpandtab "当文件类型是make的时候，
set noexpandtab
nmap \ :noh<Enter>
set statusline=%F%m%r%h%w\ [%{&ff}\|%Y]\ [%04l,%04v\|%p%%*%L] "vim状态栏的显示信息
set nocompatible " be iMproved, required
filetype off " required
call plug#begin()
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
call plug#end()

