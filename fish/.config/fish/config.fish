# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

if status is-interactive
    # PATH
    set -p PATH ~/.local/bin
    set -p PATH ~/.local/dotbin
    set -p PATH ~/.cargo/bin
    set -p PATH ~/.local/texlive/2021/bin/x86_64-linux
    # ---

    # Conda
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    eval ~/.local/conda/bin/conda "shell.fish" "hook" $argv | source
    # <<< conda initialize <<<

    # ---

    # ssh-agent
    if ! pgrep ssh-agent > /dev/null
        eval (ssh-agent -c) > /dev/null
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    end
    # ---
end

# HISTIGNORE
function ignorehistory --on-event fish_prompt
    history delete --exact --case-sensitive 'fg' 'bg'
end
