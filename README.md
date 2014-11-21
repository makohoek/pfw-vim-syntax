Vim syntax plugin for Extended Domain Description files (a.k.a .pfw files)
==========================================================================

## Previews
Here are few previews with various colorschemes:

### Default gVim
[default-gvim](https://raw.githubusercontent.com/Makohoek/pfw-vim-syntax/master/screenshots/default.png)

### Solarized light
[solarized-light](https://raw.githubusercontent.com/Makohoek/pfw-vim-syntax/master/screenshots/solarized_light.png)

### Solarized dark
[solarized-dark](https://raw.githubusercontent.com/Makohoek/pfw-vim-syntax/master/screenshots/solarized_dark.png)

### Base16-tomorrow
[base16-tomorrow](https://raw.githubusercontent.com/Makohoek/pfw-vim-syntax/master/screenshots/base16-tomorrow.png)

## Install instructions:

### With plugin manager (Pathogen)
Just clone this repo into your your `~/.vim/bundle` directory.

    git clone https://github.com/Makohoek/pfw-vim-syntax.git

### Without plugin manager
Copy the content of this repo into your `~/.vim` directory.

    git clone https://github.com/Makohoek/pfw-vim-syntax.git
    cp -r pfw-vim-syntax/* ~/.vimrc/

## Missing features / known issues

* No indentation file so vim does not know how to autoindent .pfw files
