# MYVIM
## Table of Contents
- [Introduction](#Introduction)
- [Install](#Install)
- [Dependence](#Dependence)
- [Issues](#Issues)
- [PartialContentLinks](#PartialContentLinks)

## Introduction
This is my preference for the VIM configuration,which is included
- Theme
- Preference
- Plug-in

## Install
Firstly,you shuld clone this pakage to your suitable folder.
```bash
git clone https://github.com/Ge0rgeCai/MYVIM.git
Or Use "Github CLI"
gh repo clone Ge0rgeCai/MYVIM
```
Use `.vimrc` to configurate Vim
And use `_vimrc` to configurate Gvim
## Dependence
- [vim-plug](https://github.com/junegunn/vim-plug) Plug-in manager
- [coc.nvim](https://github.com/neoclide/coc.nvim) Automatic compeltion of code
## Issues
### hosts
The download may fail when installing `vim-plug`.
The may be the problem with `hosts`.
You can modify the `hosts`to solve the hosts problem.
Add the following code to end of your `hosts` to solve this problem.
``` bash
199.232.28.133 raw.githubusercontent.com
```
### Change of Keys(Optional)
The `<Esc>` is often used,so swapping <Esc> with <Caps_Lock> can make it more convenient for us.
1. **Windows**:<br/>
It is mainly using registry to change keys,in Windows OS.
- Writing the following code into `caps.reg` and RUN.
```
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=hex:00,00,00,00,00,00,00,00,03,00,00,00,01,00,3a,00,3a,00,01,00,00,00,00,00
```
- Using `regedit` to add it manually.
`Win`+`R`--> typing `regedit` --> To find `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout`
--> RightClick `Keyboard Layout` --> "New Flie" or "New" --> "binary value" --> Renamed "Scancode Map" --> "edit"
--> Typing the following value:
```
0000 00 00 00 00 00 00 00 00
0008 03 00 00 00 01 00 3a 00
0010 3a 00 01 00 00 00 00 00
0018
```
2. **Linux**:<br/>
Linux users can create `keys.conf` and use command `loadkeys keys.conf` to change the translation from Linux keyboard driver to keyboard input.
#keys.conf file
```
keycode 1 = Caps_Lock
keycode 58 = Escape
```
But this way maybe fail in some desktop environment.
## PartialContentLinks
 Theme：<br/>
[vim-one](https://github.com/rakr/vim-one)<br/>
[molokai](https://github.com/tomasr/molokai)
