vimified
========

> Frankly, my dear, you're gonna be vimified one day!

Kick-ass Vim configuration framework, built on top of *awesome* [Vundle](https://github.com/gmarik/vundle). 

![ctrlp view](http://f.cl.ly/items/3a0X3F3x3r0K1n1u1Y2r/vimified.png)

How to install
--------------

Grab the project:

    cd 
    git clone git://github.com/wgx731/vimified.git
    ln -sfn vimified ~/.vim
    ln -sfn vimified/vimrc ~/.vimrc
    cd vimified

Create required directories

    mkdir bundle
    mkdir -p tmp/backup tmp/swap tmp/undo

Set up Vundle

    git clone https://github.com/gmarik/vundle.git bundle/vundle

Set up your local configuration via `local.vimrc` file and choose package you
want to use:

    echo "let g:vimified_packages = ['general', 'fancy', 'python', 'ruby', 'css', 'js', 'html', 'color']" > local.vimrc

Install plugins: 

    vim +BundleInstall +qall

Enjoy!

Configuration
-------------

You can overwrite default configuration and key bindings by using one of following files:

`~/.vim/before.vimrc` will be loaded before everything else. 

`~/.vim/after.vimrc` will be loaded after all configuration options are set. This is best place to change vimified default behaviour (keybindings) and/or color scheme.
    
Packages
--------

Inside your local configuration file `$HOME/.vim/local.vimrc` set `g:vimified_packages` variable with packages you want to use. 

For example, if you are only interested in Ruby/Rails related stuff, put something like the following line inside `$HOME/.vim/local.vimrc`:

    let g:vimified_packages = ['general', 'ruby', 'color']

Avaible packages:

 * general
 * fancy 
 * ruby
 * python
 * html
 * css
 * js 
 * color

### General 

#### [vim-repeat](https://github.com/tpope/vim-repeat)

repeat.vim: enable repeating supported plugin maps with "."

#### [vim-speeddating](https://github.com/tpope/vim-speeddating)

speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more 

#### [vim-surround](https://github.com/tpope/vim-surround)

surround.vim: quoting/parenthesizing made simple 

#### [vim-unimpaired](https://github.com/tpope/vim-unimpaired)

unimpaired.vim: pairs of handy bracket mappings 

#### [nerdtree](https://github.com/scrooloose/nerdtree)

A tree explorer plugin for vim.

**Command:** `ctrl-u`

#### [taglist](https://github.com/vim-scripts/taglist.vim)

Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)

#### [tagbar](https://github.com/majutsushi/tagbar)

Vim plugin that displays tags in a window, ordered by class etc. 

**Command:** `,t`

#### [nerdcommenter](https://github.com/scrooloose/nerdcommenter)

Vim plugin for intensely orgasmic commenting.

**Command:** `,/`

#### [splice.vim](https://github.com/sjl/splice.vim)

A Vim plugin for managing three-way merges. 

#### [syntastic](https://github.com/scrooloose/syntastic)

Syntax checking hacks for vim 

### Fancy

#### [airline](https://github.com/bling/vim-airline)

The ultimate vim statusline utility.

### Ruby 

#### [vim-endwise](https://github.com/tpope/vim-endwise)

endwise.vim: wisely add "end" in ruby, endfunction/endif/more in vim script, etc 

#### [vim-rails](https://github.com/tpope/vim-rails)

rails.vim: Ruby on Rails power tools 

### PYTHON

#### [indentpython.vim](https://github.com/vim-scripts/indentpython.vim)

An alternative indentation script for python

### HTML

#### [html5.vim](https://github.com/othree/html5.vim)

HTML5 omnicomplete funtion and syntax for Vim. Based on the default htmlcomplete.vim

#### [vim-markdown](https://github.com/tpope/vim-markdown)

Vim Markdown runtime files

### CSS

#### [Better-CSS-Syntax-for-Vim](https://github.com/ChrisYip/Better-CSS-Syntax-for-Vim)

Highlights for full CSS2, most of HTML5 & CSS3 properties (include prefix like -moz-).

#### [vim-less](https://github.com/groenewege/vim-less)

This vim bundle adds syntax highlighting, indenting and autocompletion for the dynamic stylesheet language LESS.

### JS

#### [vim-javascript](https://github.com/pangloss/vim-javascript)

#### [vim-json](https://github.com/leshill/vim-json)

#### [vim-jquery](https://github.com/itspriddle/vim-jquery)

### Color 

#### [molokai](https://github.com/tomasr/molokai)

Molokai color scheme for Vim. 

#### [badwolf](https://github.com/sjl/badwolf)

A Vim color scheme.


## Call for Help

If you have ideas on how to make this Vim configration framework better, don’t hesitate to fork and send pull requests. Thanks!

### Contributors

 * [sharnik](https://github.com/sharnik)
 * [wgx731](https://github.com/wgx731)

### Inspired by 

 * [dotvim](https://github.com/astrails/dotvim)
 * [Steve Losh's dotfiles](https://github.com/sjl/dotfiles)
 * [skwp's dotfiles](https://github.com/skwp/dotfiles)

### Cooked by [Zaiste!](http://zaiste.net)
### Used & Modified by [wgx731](http://twitter.com/wgx731)
