au BufNewFile,BufRead Snakefile,*.typ set filetype=typst
au BufNewFile,BufRead Snakefile,*.typ let b:dispatch = 'typst w --open zathura % /tmp/%.pdf'
