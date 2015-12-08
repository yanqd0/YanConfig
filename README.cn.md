# YanConfig 说明

这个repo是我个人存放MacOSX、Linux、Windows三大平台配置文件的地方。目前主要包括：

- [Vim](#vim)
- Vimperator
- Bash

## Vim

### table of set *

在*vimrc*文件中出现的`set *`选项，其中涵义，简要列在下方。

| set *                | =?                 | comment                            |
| :----                | :--                | :------                            |
| nocompatible (nocp)  | --                 | 不兼容Vi，打开iMproved的高级功能   |
| background (bg)      | light or *dark*    | 设置背景色                         |
| t_Co                 | 256                | 设置终端颜色为256（部分配色需要）  |
| number (nu)          | --                 | 显示行号                           |
| relativenumber (rnu) | --                 | 显示相对当前光标行的行号           |
| numberwidth (nuw)    | 3 default(4)       | 行号的最小默认宽度                 |
| history (hi)         | 1000 (default 50)  | 设置“:”命令的历史条数              |
| showcmd (sc)         | --                 | 显示命令                           |
| ruler (ru)           | --                 | 显示光标行列位置                   |
| wild                 |                    |                                    |
| laststatus (ls)      | 2 (default 1)      | 始终显示状态栏                     |
| cursorline (cul)     | --                 | 光标行高亮                         |
| cursorcolumn (cuc)   | --                 | 光标列高亮（建议关闭）             |
| showmatch (sm)       | --                 | 输入右括号时光标会短暂地跳到其匹配 |
| mouse                | see :h 'mouse'     | 设置指定模式下使用鼠标功能         |
| mousehide (mod)      | --                 | 输入文字时，隐藏鼠标               |
| splitright (spr)     | --                 | 新的水平分割窗口显示在右边         |
| splitbelow (sb)      | --                 | 新的垂直分割窗口显示在底部         |
| tabpagemax (tmp)     | 50 (default 10)    | 设置最大TAB页数                    |
| hlsearch (hls)       | --                 | 高亮搜索                           |
| incsearch (is)       | --                 | 在键入目标字符时就开始搜索         |
| ignorecase (ic)      | --                 | 忽略大小写                         |
| smartcase (scs)      | --                 | 只输入小写时忽略大小写，否则不忽略 |
| redrawtime (rdt)     | 500(default 2000)  | 搜索最大匹配时间，防止搜索卡顿     |
| shiftwidth (sw)      | 4 (default 8)      | 缩进的字符个数                     |
| tabstop (ts)         | 4 (default 8)      | 一个<TAB>长度相当于几个空格        |
| softtabstop (sts)    | -1 (default 0)     | <BS>删除空格数，负数则等于tabstop  |
| expandtab (et)       | --                 | 用空格代替<TAB>                    |
| smarttab (sta)       | --                 | <Tab>自动插入对应空白符            |
| autoindent (ai)      | --                 | 下一行自动缩进                     |
| smartindent (si)     | --                 | 下一行按语法自动缩进               |
| cindent (cin)        | --                 | 下一行按C语法自动缩进              |
| backspace (bs)       | indent,eol,start   | <BS>删除缩进/合并两行/无前界       |
| list                 | --                 | 显示<TAB>等空字符                  |
| listchars (lcs)      | see :h 'lcs'       | 设置空字符的显示方式               |
| wrap                 | --                 | 屏幕宽度不够时自动换行显示         |
| linebreak (lbr)      | --                 | wrap时按词分割而不是按最大宽度     |
| breakat              | " ^I!*-+;:,./?"    | 选择会导致可以分词wrap的特殊字符   |
| showbreak (sbr)      | >\ (default "")    | 显示特殊字符表示wrap换行           |
| breakindent (bri)    | --                 | wrap时自动缩进                     |
| breakindentopt       | min:40,shift:4,sbr | 最小显示、缩进宽度，sbr显示在行首  |
| clipboard (cb)       | see :h 'cb'        | 设置剪切板，常用系统剪切板unnamed  |
| foldenable (fen)     | --                 | 允许折叠                           |
| foldmethod (fdm)     | syntax,see h 'fdm' | 折叠策略，常用**语法**或缩进       |
| foldcolumn (fdc)     | 4 (default 0)      | 在行号左边显示折叠情况，0则不显示  |
| foldnestmax (fdn)    | 2 (default 20)     | 最大折叠层数，折叠太深不实用       |
| foldminlines (fml)   | 4 (default 1)      | 最小折叠行数，太短就没必要折叠     |
| foldopen (fdo)       | all                | 光标遇到折叠时自动打开             |
| foldclose (fcl)      | all                | 光标移开折叠时自动关闭             |
| backup (bk)          | --                 | 设置备份                           |
| backupdir (bdir)     | ~/.vim/.backup/    | 设置备份文件位置，以免污染当前路径 |
| backupskip (bsk)     | +=.git/*           | 设置不备份的文件，用+=添加         |
| backupcopy (bkc)     | auto               | 自动选择备份方式为复制或复写       |
| backupext (bex)      | .bak (default "~") | 备份文件命的末尾                   |
| patchmode (pm)       | .org (default "")  | 生成.org结尾的备份，*不懂勿用*     |
| swapfile (swf)       | --                 | 为正在编辑的buffer设置交换文件     |
| directory (dir)      | ~/.vim/.swp//      | 设置交换文件位置，以免污染当前路径 |
| autoread (ar)        | --                 | 文件改变时自动读取                 |
| autowrite (aw)       | --                 | buffer改变时自动保存文件           |
| formatoptions (fo)   | tcroqwbmBj         | 一堆自动格式化的功能，see fo-table |
| fileencodings(fencs) | 见代码             | 支持CJK各平台编码，防止乱码        |
| fileformat (ff)      | unix,doc,mac       | 识别文件格式，影响换行符           |
| noautochdir (noacd)  | --                 | 不要自动切换当前目录，影响部分插件 |

### useful fuctions

列出部分常用而少见的命令（括号内的字符可省略）。

| fuction          | description           |
| :------          | :----------           |
| `:colo(rscheme)` | 切换配色方案          |
| `:ret(ab)[!]`    | 把所有<TAB>替换成空格 |
| `:reg(isters)`   | 显示寄存器            |
| `:buffers[!]`    | 显示buffer区文件      |
| `:ls[!]`         | 同上                  |
