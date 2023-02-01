# shellcheck disable=SC1090,SC2181 shell=bash
bindkey -e
bindkey "\e[3~" delete-char

# Allow Ctrl-z to toggle between suspend and resume
function Resume {
    fg
    zle push-input
    # shellcheck disable=SC2034
    BUFFER=""
    zle accept-line
}
zle -N Resume
bindkey "^Z" Resume

autoload compinit
fpath+="${HOME}/.zfunc"
compinit

# functions -------------------------------
zshrcmsg() {
    echo -e "\033[1;33m[zshrc] ${1}\033[0m"
}
zshrcwarn() {
    echo -e "\033[0;33m[zshrc] ${1}\033[0m"
}
has() {
    command -v "$1" >/dev/null
}
# -----------------------------------------

# Aliases -----------------------------------------------
alias '..'='cd ..'
alias 'gits'="git status --short"
alias 'g'="git"
alias 'pgrep'='pgrep -a'
alias 'pkill'='pkill -e'
has exa && alias 'ls'="exa"
has exa && alias 'tree'="exa -T"
(has exa && alias 'l'='exa -l --git') || alias 'l'='ls -l'
alias 'll'="ls -l"
alias 'julianb'="julia -q -i -e 'using IJulia; notebook()'"
alias 'pluto'="julia -q -i -e 'using Pluto; Pluto.run()'"
alias 'runzip'="fd -e zip -x unzip -nq {} -d {//}"
has nvim && alias 'vim'='nvim'
alias vi=vim
function openpdf() {
    fd "" -e pdf --full-path "${1-$HOME}" | dmenu -i -l 99 | xargs -r xdg-open
}
alias 'nbconvert'="jupyter nbconvert --to script --no-prompt"
[ -f "${HOME}/.aliases" ] && . "${HOME}/.aliases" # Local Aliases
function o() {
    gio open "$@"
}
function cpr() {
    rsync -avzuhrP --info=stats1,progress2 --modify-window=1 "$@"
}
function mountremote() {
    mntpoint="${HOME}/mounts/$1"
    mkdir -p "${mntpoint}"
    sshfs -o auto_cache,no_readahead,reconnect,ServerAliveInterval=30,ServerAliveCountMax=2 "$1:$2" "${mntpoint}"
}
function cdtmp() {
    cd "$(mktemp -d)" || return
}
function build-nvim() {
    make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/" "$@"
}
function help() {
    "$@" --help 2>&1 | bat --plain --language=help
}
#--------------------------------------------------------

# PATH -----------------------------------------------------------
export PATH="${HOME}/.local/bin/:${PATH}"
export PATH="${HOME}/.local/dotbin/:${PATH}"
export PATH="${HOME}/.cargo/bin/:${PATH}"
export PATH="${HOME}/.local/texlive/2022/bin/x86_64-linux:${PATH}"
export PATH="./target/release/:./target/debug/:${PATH}" # cargo
export PATH="${HOME}/.npm-packages:${PATH}"
export PATH="./zig-out/bin:${PATH}"
export PATH="${HOME}/.config/composer/vendor/bin:${PATH}"
export PATH="${HOME}/.go/bin:${PATH}"
# ----------------------------------------------------------------

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
export FZF_DEFAULT_COMMAND='fd --hidden'
export FZF_DEFAULT_OPTS='--no-bold --reverse'
export FZF_CTRL_T_COMMAND=fd
export FZF_ALT_C_COMMAND='fd --type d'
export FZF_ALT_C_OPTS='--preview "exa --color=always {}"'
# -------------------------------------------------------

# Conda ----------------------------------------------
if [ -f "${CONDA_PATH}/etc/profile.d/conda.sh" ]; then
    . "${CONDA_PATH}/etc/profile.d/conda.sh"
else
    export PATH="${CONDA_PATH}/bin:$PATH"
fi

if [ -f "${CONDA_PATH}/etc/profile.d/mamba.sh" ]; then
    . "${CONDA_PATH}/etc/profile.d/mamba.sh"
fi
# ----------------------------------------------------

dircolorsfile="${HOME}/.dircolors"
if ! [ -f "${dircolorsfile}" ]; then
    zshrcmsg "Setup LS_COLORS"
    curl -fsSL https://raw.githubusercontent.com/arcticicestudio/nord-dircolors/develop/src/dir_colors -o "${dircolorsfile}"
fi
eval "$(dircolors "${dircolorsfile}")"

# Variables -----------------------
exportif() {
    if command -v "${1}" >/dev/null; then
        export "${2}"="${3}"
    elif [ -n "${4}" ]; then
        export "${2}"="${4}"
    fi
}
exportif bat MANPAGER "bat -l man -p" "less -F"
exportif bat PAGER "bat --plain" "less -F"
exportif bat BAT_THEME "Nord"
exportif delta GIT_PAGER "delta --color-only --diff-highlight --side-by-side"
export GOPATH="${HOME}/.go"
export PYTEST_ADDOPTS="--pdbcls=IPython.terminal.debugger:TerminalPdb"
export NFSHOME="/net/nfshome/home/${USER}"
# ---------------------------------

[ -f "/home/noah/.ghcup/env" ] && source "/home/noah/.ghcup/env" # ghcup-env

# SSH AGENT ----------------------------
ENV="${HOME}/.ssh/ssh-agent-environment"
if ! [ -f "${ENV}" ]; then
    ssh-agent >"${ENV}"
else
    . "${ENV}" >/dev/null
    if ! [ -S "${SSH_AUTH_SOCK}" ]; then
        rm "${ENV}"
        ssh-agent >"${ENV}"
    fi
fi
. "${ENV}" >/dev/null
# --------------------------------------

# Plugins
export ZSH_HOME="${HOME}/.zsh"
[[ -d "${ZSH_HOME}" ]] || mkdir "${ZSH_HOME}"
gclone() {
    git clone --quiet --depth=1 "https://github.com/$1" "$2"
}

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUPSTREAM="auto"
if ! [ -f "${ZSH_HOME}/git-prompt.sh" ]; then
    zshrcmsg "Installing git prompt."
    curl -fsSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o "${ZSH_HOME}/git-prompt.sh"
fi
. "${ZSH_HOME}/git-prompt.sh"
setopt PROMPT_SUBST
PS1='%n@%m %~$(__git_ps1 " (%s)") \$ '

if ! [ -d "${ZSH_HOME}/zsh-autosuggestions" ]; then
    zshrcmsg "Installing autosuggestions."
    gclone zsh-users/zsh-autosuggestions "${ZSH_HOME}/zsh-autosuggestions"
fi

if ! [ -d "${ZSH_HOME}/zsh-syntax-highlighting" ]; then
    zshrcmsg "Installing syntax highlighting."
    gclone zsh-users/zsh-syntax-highlighting "${ZSH_HOME}/zsh-syntax-highlighting"
fi

zfile="${ZSH_HOME}/.z.sh"
if ! [ -f "${zfile}" ]; then
    zshrcmsg "Installing z"
    curl -fsSL https://raw.githubusercontent.com/rupa/z/master/z.sh -o "${zfile}"
fi
. "${zfile}"

source "${ZSH_HOME}/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${ZSH_HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" # this is the last line
