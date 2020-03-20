function Light()
    silent ! wal -f base16-gruvbox-hard -l -q &
    set background=light
    colorscheme gruvbox
endfunction

function Dark()
    silent ! wal -f ~/.colorschemes_wal/.nord.json -q &
    set background=dark
    colorscheme nord
endfunction
