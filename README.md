# dotfiles
My ssh config, vimrc, .screenrc, alias

<img src="https://www.puritys.me/filemanage/blog_files/file_362.jpg" width="500" alt="Chrome SSH terminal" />

# How to install

First time to install dotfiles.
* ./install.sh -i

Update dotfiles
* ./install.sh

Auto install vim plugins
* ./install.sh -p

Auto install fzf
* ./install.sh -f



## Install Font

The bashrc will use powerline font, so you have to install this font by yourselves. The font is on the dir "assets" named "Meslo LG M Regular for Powerline.otf".

* assets/Meslo LG M Regular for Powerline.otf


On the other side, I suggest you to install a pretty font called "PT Mono".
* https://fonts.google.com/specimen/PT+Mono

How to let these two fonts exist on the terminal?
In software iTerm2, you can open it's preferences interface and change the regular font to be "PT Mono" and the Non-ASCII font to be "Powerline symbols"

## customized

You can customzied any alias and env variable by just create these three dotfiles.
* Add file ~/.bash_host
* Add file ~/.bash_customzied
* Add file ~/.alias_customized

How to set hostname on your terminal. You can add a environment host on ~/.bash_host:
```
host=MacMini
```

## Useful Tool

- fasd: Recent directories / files finder
- fzf: file fuzzy finder 
- ag: better grep command
- bashIt: Similar to Oh My Zsh,  it support auto complete command.
- eclim: Integrate eclipse

## Vim Plugins

|plugin | shortcut| description|
|:---|:---|:---|
| jistr/vim-nerdtree-tabs        |          | Show file tree when you call ":tabe" to open a file |
| junegunn/fzf                   | [Ctrl+p] | Fuzzle search for opening a existed file            |
| thinca/vim-quickrun            | [Ctrl+e] | Execute the file you are editing                    |
| ntpeters/vim-better-whitespace |          | Show white space of line tail                       |
| haya14busa/incsearch.vim       |          | Better search interface                             |
| vim-syntastic/syntastic        | sc       | syntax check                                        |
| garbas/vim-snipmate            |          | Auto complete script                                |
|1995eaton/vim-better-javascript-completion| |Javascript auto complete function|
| Valloric/YouCompleteMe     |               | Auto complete function for c/c++/ruby/... |
| google/vim-codefmt         |               | Auto fix java code formatter/indent       |
| vim-airline/vim-airline    |               | Beautiful status bar and tab              |
| godlygeek/tabular          | align,<Enter> | Auto align code                           |
| vim-json-line-format       | ,jp ,jw       | JSON Parser (support unicode)             |
| shawncplus/phpcomplete.vim |               | PHP Auto Complete                         |
| Yggdroot/indentLine        |               | Display indent line                       |
| vim-scripts/PDV--phpDocumentor-for-Vim| doc | generate php document |
Attentions.
* ctags is needed by vim-nerdtree-tabs and shawncplus/phpcomplete.vim.

### Included plugins
|plugin | shortcut| description|
|:---|:---|:---|
| vim/plugin/JavaImp.vim        | :JI/:JIS | Auto import java packages     |
| vim/plugin/tabline.vim        |          | Menu                          |
| vim/autoload/javacomplete.vim |          | Auto complete Java function   |
| vim/autoload/gocomplete.vim   |          | Auto complete golang function |
| vim/autoload/omni/            |          | Auto complete C/C++ function  |



## Auto Complete

* PHP: ctags -R --fields=+laimS --languages=php
