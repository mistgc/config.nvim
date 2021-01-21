# MYVIM
## 目录
- [介绍](#介绍)
- [安装](#安装)
- [依赖](#依赖)
- [问题](#问题)
- [部分内容链接](#部分内容链接)

## 介绍
这是一个我个人所偏好的VIM配置，里面的内容包括了
- 主题
- 偏好配置
- 插件

## 安装
首先将clone这个包到你合适的目录中.
```bash
git clone https://github.com/Ge0rgeCai/MYVIM.git
Or Use "Github CLI"
gh repo clone Ge0rgeCai/MYVIM
```
在vim中使用`.vimrc`来配置文件
在gvim中使用`_vimrc`来配置文件
## 依赖
- [vim-plug](https://github.com/junegunn/vim-plug) 插件管理器
- [coc.nvim](https://github.com/neoclide/coc.nvim) 代码自动补全插件
## 问题
### hosts
当在下载安装 `vim-plug` 时，可能会安装失败。
这可能是 `hosts` 的问题，你可以通过修改 `hosts` 文件来解决这个问题。
添加下面的代码进你的 `hosts` 文件内。
```
199.232.28.133 raw.githubusercontent.com
```
## 部分内容链接
 主题：
[vim-one](https://github.com/rakr/vim-one) 
[molokai](https://github.com/tomasr/molokai)
