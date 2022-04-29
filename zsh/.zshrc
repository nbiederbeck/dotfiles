[ "$(tty)" = "/dev/tty1" ] && exec startx

# functions -------------------------------
zshrcmsg () {
    echo -e "\033[1;33m[zshrc] ${1}\033[0m"
}
zshrcwarn () {
    echo -e "\033[0;33m[zshrc] ${1}\033[0m"
}
has () {
    command -v $1 > /dev/null
}
# -----------------------------------------

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
ANTIGEN="${HOME}/.antigen.zsh"
if ! [ -f "${ANTIGEN}" ]; then
    zshrcmsg "Installing antigen"
    curl -fsSL git.io/antigen > "${ANTIGEN}"
fi
. "${ANTIGEN}"
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen use oh-my-zsh
antigen bundle ssh-agent
if (( $ZSH_VERSION[1,3] <= 5.1 )); then
    antigen theme robbyrussell
else
    antigen theme dracula/zsh
fi
antigen apply
# ------------------------------------------------------------

# >>> conda initialize >>>
CONDA_PATH="${HOME}/.local/conda"
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("${CONDA_PATH}/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${CONDA_PATH}/etc/profile.d/conda.sh" ]; then
        . "${CONDA_PATH}/etc/profile.d/conda.sh"
    else
        export PATH="${CONDA_PATH}/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

bindkey "^[[3~" delete-char

has module && module add git ripgrep texlive python neovim

# Aliases -----------------------------------------------
alias gits="git status --short"
alias g="git"
has exa && alias ls="exa"
has exa && alias tree="exa -T"
alias ll="ls -l"
alias julianb="julia -q -i -e 'using IJulia; notebook()'"
alias pluto="julia -q -i -e 'using Pluto; Pluto.run()'"
alias cal="cal -mv3 | grep --color -E 'S[au].*|$'"
alias runzip="fd -e zip -x unzip -nq {} -d {//}"
has nvim && alias vim='nvim'
function openpdf () {
    fd "" -e pdf --full-path "${1-$HOME}" | dmenu -i | xargs -r xdg-open
}
alias nbconvert="jupyter nbconvert --to script --no-prompt"
[ -f "${HOME}/.aliases" ] && . "${HOME}/.aliases"  # Local Aliases
function o () {
    gio open "$@"
}
function t () {
    tmux attach || sleep 1 && tmux
}
function cpr() {
    rsync -avzuhrP --info=stats1,progress2 --modify-window=1 "$@"
}
function mountremote () {
    mntpoint="${HOME}/mounts/$1"
    mkdir -p "${mntpoint}"
    sshfs -o auto_cache,no_readahead,reconnect,ServerAliveInterval=30,ServerAliveCountMax=2 $1:$2 "${mntpoint}"
}
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
export PATH="./target/release/:./target/debug/:${PATH}"  # cargo
# ----------------------------------------------------------------

dircolorsfile="${HOME}/.dircolors"
if ! [ -f "${dircolorsfile}" ]; then
    zshrcmsg "Setup LS_COLORS"
    curl -fsSL https://raw.githubusercontent.com/arcticicestudio/nord-dircolors/develop/src/dir_colors -o "${dircolorsfile}"
fi
eval "$(dircolors "${dircolorsfile}")"

# Variables -----------------------
exportif () {
    if command -v "${1}" > /dev/null; then
        export "${2}"="${3}"
    fi
}
exportif bat MANPAGER "sh -c 'col -bx | bat -l man -p'"
exportif bat PAGER "bat --plain"
exportif bat GITPAGER "bat --plain"
# ---------------------------------

alias vim=hx
