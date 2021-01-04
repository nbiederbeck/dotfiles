# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

# Anaconda
for conda_exe in /opt/anaconda/bin/conda ~/.local/anaconda3/condabin/conda
    if test -f $conda_exe
        eval $conda_exe "shell.fish" "hook" $argv | source
    end
end

# Paths
set PATH $PATH ~/.local/bin
set PATH $PATH ~/.local/dotbin
