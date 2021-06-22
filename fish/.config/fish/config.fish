# Paths
set -p PATH ~/.local/bin
set -p PATH ~/.local/dotbin
set -p PATH ~/.cargo/bin
set -p PATH ~/go/bin
set -p PATH ~/.local/texlive/2021/bin/x86_64-linux

# Variables
set FZF_TMUX 0
set FZF_TMUX_HEIGHT 10
set FZF_DEFAULT_OPTS '--no-bold --reverse'
set FZF_CTRL_T_COMMAND fd
set FZF_ALT_C_COMMAND 'fd --type d'
set FZF_ALT_C_OPTS '--preview "ls --color=always {}"'
set HISTIGNORE 'fg:ls'
set FONTCONFIG_FILE $CONDA_PREFIX/etc/fonts/fonts.conf
set FONTCONFIG_PATH $CONDA_PREFIX/etc/fonts/
set IPYTHONDIR ~/.ipython/

# Completions
kitty + complete setup fish | source

set -U pisces_only_insert_at_eol 1

eval $HOME/.local/miniconda3/bin/conda "shell.fish" "hook" $argv | source
