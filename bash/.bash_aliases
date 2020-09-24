# vim: ft=sh

alias 'feh'='feh -dF'

alias 'lg'='lazygit'

alias 'ta'='tmux attach'

alias 'nb'='ssh -N -f -L 2702:localhost:2702'

alias 'sshfs-e5b'='sshfs -o reconnect,no_readahead,compression=yes'

# games
alias 'anno'='wine /home/noah/.wine/drive_c/Program\ Files\ \(x86\)/ANNO\ 1602\ Königs-Edition/1602.exe'

# cding
alias 'msc'='conda activate; cd ~/Uni/MSc/master-thesis/code'
alias 'prak'='cd ~/Uni/MSc/praktikum && conda activate'
alias 'thesis'='cd ~/Uni/MSc/master-thesis; source .env/bin/activate.bash'

# Useful abbreviations
alias 'up'='uptime --pretty'
alias 'gits'='git status -sb'
alias 'gdiff'='git diff'
alias 'open'='gio open'
alias 'xclip'='xclip -selection c'
alias 'htop'='htop -u $USER'
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias 'calc'='bc -l; exit'
alias 'now'='cal -m;date'

# Useful optional arguments for commonly used commands
# alias 'rm'='rm -vI'
# alias 'mv'='mv -v'
# alias 'cp'='cp -v'
# alias 'mkdir'='mkdir -p'
# alias 'ls'='ls --color="always"'
alias 'll'='ls -al'
alias 'la'='ls -a'
# if [[ $(command -v exa) ]]; then
#     alias 'ls'='exa'
# fi
# alias ls=$(command -v exa || command -v ls)
# alias 'make'='time make'
# alias 'python'='time python'

# Python commands
# alias 'notebook'='jupyter notebook' # && nbconvert *.ipynb'
# alias 'nbconvert'='time jupyter nbconvert --to python'
alias 'ppip'='python -m pip'
alias 'pip-upgrade'='echo "pip install -U pip && pip install -U \$(pip list -o --format freeze | sed \"s/==.*//\")" && pip install -U pip && pip install -U $(pip list -o --format freeze | sed "s/==.*//")'
alias 'pip-freeze'='pip freeze | sed "s/==.*//"'
alias 'conda-freeze'='conda list | sed "s/\ .*//"'
alias 'lab'='jupyter lab --no-browser'
# alias 'conda2'='source ~/miniconda2/etc/profile.d/conda.sh'
# alias 'conda3'='source ~/miniconda3/etc/profile.d/conda.sh'
alias 'jn'='jupyter-notebook --port=2702 --no-browser'
alias 'jl'='jupyter-lab --port=2702 --no-browser --ip=0.0.0.0'

# # Work with servers (particularly Vollmond)
alias 'vollmondtunnel'='ssh -N -f -L 2702:localhost:2702 vollmond'
alias 'vollmondtunnelproxy'='ssh -N -f -L 2702:localhost:2702 proxy'
# alias 'copyplots'='rsync -avzuh --progress -e ssh nbiederbeck@vollmond:bachelorArbeit/*  /media/noah/23c4ddbc-85fa-4cea-b96b-edae0bb138c9/bachelorArbeit_fromVollmond/'
# alias 'vollmondnotebook'='ssh -f -N vollmondtunnel'
# alias 'scp'='scp -i $HOME/.ssh/id_rsa.phido'

alias 'fim'='vim $(fd --type f | fzf --preview "bat --color=always {} --theme OneHalfDark| head -100")'
alias 'fcd'='cd $(fd --type d --hidden --exclude *conda* | fzf --preview "ls {} -a --color=always")'
alias 'cdf'='cd $(fd --type d | fzf --preview "ls {} -a --color=always")'

# Misc
# alias 'pdfpandoc'='pandoc -r markdown -w latex -o'
alias 'speedtest'='time seq -f "test %g"'
alias 'rustbook'='surf ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/share/doc/rust/html/book/second-edition/index.html &'

alias "listgit"="fd '\.git$' -HI -t d -E .vim -E .cache -E .oh-my-zsh -E .cargo"

alias "cpu"="ps -e --user noah --format 'cmd pid %mem %cpu' --sort -%cpu,-%mem | head"
