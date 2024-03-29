# shellcheck disable=SC1090,SC2181 shell=bash
export ZSH_HOME="${HOME}/.zsh"
[[ -d "${ZSH_HOME}" ]] || mkdir "${ZSH_HOME}"

bindkey -e
bindkey "\e[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-delete-word

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

setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups
export HISTFILE=~/.zhistory
export HISTSIZE=100
export SAVEHIST=$HISTSIZE

setopt interactive_comments
setopt correct
setopt auto_cd

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
bell() {
    echo -e "\007"
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
alias hx=helix
function openpdf() {
    fd "" -e pdf --full-path "${1-$HOME}" | dmenu -i -l 99 | xargs -r xdg-open
}
alias 'nbconvert'="jupyter nbconvert --to script --no-prompt"
alias 'lg'='lazygit'
alias line='tput rev; for i in 1 {2..$(tput cols)}; do printf " "; done'
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
function svg2pdf() {
    inkscape "$1" --export-filename="${1/.svg/.pdf}"
}
#--------------------------------------------------------

# PATH -----------------------------------------------------------
export PATH="${HOME}/.local/bin/:${PATH}"
export PATH="${HOME}/.local/dotbin/:${PATH}"
export PATH="${HOME}/.cargo/bin/:${PATH}"
export PATH="${HOME}/.local/texlive/2023/bin/x86_64-linux:${PATH}"
export PATH="./target/release/:./target/debug/:${PATH}" # cargo
export PATH="${HOME}/.npm-packages:${PATH}"
export PATH="./zig-out/bin:${PATH}"
export PATH="${HOME}/.config/composer/vendor/bin:${PATH}"
export PATH="${HOME}/.go/bin:${PATH}"
export PATH="${HOME}/.config/i3/bin:${PATH}"
has ruby && {
    GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
    export GEM_HOME
    export PATH="${GEM_HOME}/bin/:${PATH}"
}
export PATH="${PATH}:${HOME}/.local/share/nvim/mason/bin"
# this way dmenu has also the local path
test -f "${HOME}/.cache/dmenu_run" || dmenu_path >/dev/null 2>&1
# ----------------------------------------------------------------

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
exportif bat MANPAGER "bat --plain" "less -F"
exportif bat PAGER "bat --plain" "less -F"
exportif bat BAT_THEME "base16"
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
# PS1='%Bbold%b %Uunderline%u %Sstandout%s'
PS1='%n@%m %~$(__git_ps1 " (%s)") %S%(?.%s.%?%s )
\$ '

FZF_HOME="${ZSH_HOME}/fzf"
if ! [ -d "${FZF_HOME}" ]; then
    zshrcmsg "Installing FZF"
    gclone junegunn/fzf "${FZF_HOME}"
    "${FZF_HOME}/install" --bin
fi
FZF_FILE="${HOME}/.fzf.zsh"
if ! [ -f "${FZF_FILE}" ]; then
    "${FZF_HOME}/install" --all --no-fish --no-bash --no-update-rc
fi
source "${FZF_FILE}"
export FZF_TMUX=0
export FZF_TMUX_HEIGHT=10
export FZF_DEFAULT_COMMAND='fd --hidden'
export FZF_DEFAULT_OPTS='--no-bold --reverse'
export FZF_CTRL_T_COMMAND=fd
export FZF_ALT_C_COMMAND='fd --type d'
export FZF_ALT_C_OPTS='--preview "exa --color=always {}"'

has atuin && eval "$(atuin init zsh --disable-up-arrow)"

if ! [ -d "${ZSH_HOME}/zsh-autosuggestions" ]; then
    zshrcmsg "Installing autosuggestions."
    gclone zsh-users/zsh-autosuggestions "${ZSH_HOME}/zsh-autosuggestions"
fi

if ! [ -d "${ZSH_HOME}/zsh-syntax-highlighting" ]; then
    zshrcmsg "Installing syntax highlighting."
    gclone zsh-users/zsh-syntax-highlighting "${ZSH_HOME}/zsh-syntax-highlighting"
fi

if ! [ -d "${ZSH_HOME}/z" ]; then
    zshrcmsg "Installing z"
    gclone rupa/z "${ZSH_HOME}/z"
fi

function update-zshplugins {
    fd . -td --full-path "${ZSH_HOME}" --max-depth=1 -x git -C {} pull
}

source "${ZSH_HOME}/z/z.sh"
source "${ZSH_HOME}/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${ZSH_HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" # this is the last line
