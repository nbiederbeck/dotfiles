nnoremap U1 yypVr=
nnoremap U2 yypVr-
noremap <buffer> <F5> :ComposerStart<CR>

setlocal conceallevel=2

let g:ale_linters = {'markdown': ['vale', 'write-good', 'languagetool']}
let g:ale_languagetool_executable = '/home/nbiederbeck/Git/languagetool/LanguageTool-4.4-stable/languagetool-commandline.jar'
