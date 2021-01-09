# Anaconda
for conda_exe in /opt/anaconda/bin/conda ~/.local/anaconda3/condabin/conda
    if test -f $conda_exe
        eval $conda_exe "shell.fish" "hook" $argv | source
    end
end

# Paths
set PATH $PATH ~/.local/bin
set PATH $PATH ~/.local/dotbin

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
