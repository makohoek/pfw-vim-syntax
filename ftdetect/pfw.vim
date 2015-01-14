" PFW, aka Extended Domain Description, aka EDD, filetype file
au BufRead,BufNewFile *.{pfw}   set filetype=pfw"

" Disable expandtab since pfw tabs are part of language
autocmd FileType pfw set noet sw=4 sts=4 ts=4 tabstop=4 commentstring=#%s
