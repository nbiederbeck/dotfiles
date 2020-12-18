for conda_exe in /opt/anaconda/bin/conda ~/.local/anaconda3/condabin/conda
    if test -f $conda_exe
        eval $conda_exe "shell.fish" "hook" $argv | source
    end
end

set PATH $PATH ~/.local/bin
set PATH $PATH ~/.local/dotbin
