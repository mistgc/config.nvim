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
### Hosts
当在下载安装 `vim-plug` 时，可能会安装失败。
这可能是 `hosts` 的问题，你可以通过修改 `hosts` 文件来解决这个问题。
添加下面的代码进你的 `hosts` 文件内。

```
199.232.28.133 raw.githubusercontent.com
```
### 键位修改(可选)
在vim中因为经常使用`<ESC>`,所以我更愿意将`<Caps_Lock>`与`<ESC>`键位进行交换<br/>
1. **Windows**:<br/>
在Windows中主要是通过注册表进行键位更换的。
- 将下列代码保存为caps.reg文件，运行即可。
```
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=hex:00,00,00,00,00,00,00,00,03,00,00,00,01,00,3a,00,3a,00,01,00,00,00,00,00
```
- 通过注册表编辑器手动添加
`Win`+`R`-->输入regedit-->找到`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout`
-->右键`Keyboard Layout`-->"新建"-->"二进制值"-->重命名"新值#1"为`"Scancode Map"`-->右键"Scancode Map"
-->"修改"-->输入值如下:
```
0000 00 00 00 00 00 00 00 00
0008 03 00 00 00 01 00 3a 00
0010 3a 00 01 00 00 00 00 00
0018
```
2. **Linux**:<br/>
Linux用户可以通过创建一个`keys.conf`文件，并且使用`loadkeys keys.conf`命令来改变linux键盘驱动程序转译键盘输入过程。
#keys.conf文件内容
```
keycode 1 = Caps_Lock
keycode 58 = Escape
```
但这种方法在一些桌面环境中无法起效。更多的方法可以上网查找。
## 部分内容链接
 主题：<br/>
 [vim-one](https://github.com/rakr/vim-one)<br/>
 [molokai](https://github.com/tomasr/molokai)
