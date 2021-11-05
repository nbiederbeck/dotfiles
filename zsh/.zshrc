zshrcmsg () {
    echo -e "\033[1;33m[zshrc] ${1}\033[0m"
}
zshrcwarn () {
    echo -e "\033[0;33m[zshrc] ${1}\033[0m"
}

# Lines configured by zsh-newuser-install
HISTFILE="${HOME}/.histfile"
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename "${HOME}/.zshrc"
autoload -Uz compinit
compinit
# End of lines added by compinstall

# PLUGINS ----------------------------------------------------
if ! [ -d "${HOME}/.zplug" ]; then
    zshrcmsg "Installing zplug"
    git clone --depth 1 \
        "https://github.com/zplug/zplug" "${HOME}/.zplug"
fi
. "${HOME}/.zplug/init.zsh"
zstyle ":zplug:tag" depth 1
zplug "nbiederbeck/bin", as:command, use:"checkgit"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "dracula/zsh", as:theme
zplug "plugins/ssh-agent", from:oh-my-zsh
if ! zplug check --verbose; then
    zplug install
fi
zplug load
# ------------------------------------------------------------

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("${HOME}/.local/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${HOME}/.local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "${HOME}/.local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="${HOME}/.local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

bindkey "^[[3~" delete-char

# Aliases -----------------------------------------------
alias gits="git status"
alias ls="exa"
alias ll="ls -l"
alias o="xdg-open"
alias julianb="julia -q -i -e 'using IJulia; notebook()'"
alias pluto="julia -q -i -e 'using Pluto; Pluto.run()'"
alias cal="cal -mv3 | grep --color -E 'S[au].*|$'"
#--------------------------------------------------------

# FZF ---------------------------------------------------
if ! [ -d "${HOME}/.fzf" ]; then
    zshrcmsg "Installing FZF"
    git clone --depth 1 \
        "https://github.com/junegunn/fzf.git" \
        "${HOME}/.fzf"
    "${HOME}/.fzf/install" --all --no-{ba,fi}sh --no-update-rc
fi
. "${HOME}/.fzf.zsh"
export FZF_TMUX=0
export FZF_TMUX_HEIGHT=10
export FZF_DEFAULT_OPTS='--no-bold --reverse'
export FZF_CTRL_T_COMMAND=fd
export FZF_ALT_C_COMMAND='fd --type d'
export FZF_ALT_C_OPTS='--preview "exa --color=always {}"'
# -------------------------------------------------------

# PATH -----------------------------------------------------------
export PATH="${HOME}/.local/bin/:${PATH}"
export PATH="${HOME}/.local/dotbin/:${PATH}"
export PATH="${HOME}/.cargo/bin/:${PATH}"
export PATH="${HOME}/.local/texlive/2021/bin/x86_64-linux:${PATH}"
# ----------------------------------------------------------------

dircolorsfile="${HOME}/.dir_colors"
if ! [ -f "${dircolorsfile}" ]; then
    zshrcmsg "Setup LS_COLORS"
    curl -fsSL https://raw.githubusercontent.com/arcticicestudio/nord-dircolors/develop/src/dir_colors -o "${dircolorsfile}"
fi
eval "$(dircolors ${HOME}/.dir_colors)"
