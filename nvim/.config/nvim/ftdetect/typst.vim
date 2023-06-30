au BufNewFile,BufRead *.typ set filetype=typst
au BufNewFile,BufRead *.typ let b:dispatch = 'typst w --open zathura % /tmp/typst-tmp.pdf'
