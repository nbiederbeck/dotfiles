## If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
#export PATH=$HOME/.local/bin:$PATH
##
## Path to your oh-my-zsh installation.
#export ZSH="/home/noah/.oh-my-zsh"


## Set name of the theme to load. Optionally, if you set this to "random"
## it'll load a random theme each time that oh-my-zsh is loaded.
## See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="noahhdf"

## Set list of themes to load
## Setting this variable when ZSH_THEME=random
## cause zsh load theme from this variable instead of
## looking in ~/.oh-my-zsh/themes/
## An empty array have no effect
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "fwalch")

## Uncomment the following line to use case-sensitive completion.
## CASE_SENSITIVE="true"

## Uncomment the following line to use hyphen-insensitive completion. Case
## sensitive completion must be off. _ and - will be interchangeable.
## HYPHEN_INSENSITIVE="true"

## Uncomment the following line to disable bi-weekly auto-update checks.
## DISABLE_AUTO_UPDATE="true"

## Uncomment the following line to change how often to auto-update (in days).
## export UPDATE_ZSH_DAYS=13

## Uncomment the following line to disable colors in ls.
## DISABLE_LS_COLORS="true"

## Uncomment the following line to disable auto-setting terminal title.
## DISABLE_AUTO_TITLE="true"

## Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

## Uncomment the following line to display red dots whilst waiting for completion.
## COMPLETION_WAITING_DOTS="true"

## Uncomment the following line if you want to disable marking untracked files
## under VCS as dirty. This makes repository status check for large repositories
## much, much faster.
## DISABLE_UNTRACKED_FILES_DIRTY="true"

## Uncomment the following line if you want to change the command execution time
## stamp shown in the history command output.
## The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
## HIST_STAMPS="mm/dd/yyyy"

## Would you like to use another custom folder than $ZSH/custom?
## ZSH_CUSTOM=/path/to/new-custom-folder

## Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
## Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
## Example format: plugins=(rails git textmate ruby lighthouse)
## Add wisely, as too many plugins slow down shell startup.
#plugins=(
#    git
#    zsh-autosuggestions
#    colored-manpages
#)

#source $ZSH/oh-my-zsh.sh

## User configuration

## export MANPATH="/usr/local/man:$MANPATH"

## You may need to manually set your language environment
## export LANG=en_US.UTF-8

## Preferred editor for local and remote sessions
## if [[ -n $SSH_CONNECTION ]]; then
##   export EDITOR='vim'
## else
##   export EDITOR='mvim'
## fi

## Compilation flags
## export ARCHFLAGS="-arch x86_64"

## ssh
## export SSH_KEY_PATH="~/.ssh/rsa_id"

## Set personal aliases, overriding those provided by oh-my-zsh libs,
## plugins, and themes. Aliases can be placed here, though oh-my-zsh
## users are encouraged to define aliases within the ZSH_CUSTOM folder.
## For a full list of active aliases, run `alias`.
##
## Example aliases
## alias zshconfig="mate ~/.zshrc"
## alias ohmyzsh="mate ~/.oh-my-zsh"
#source ~/.aliases

## Conda
#source ~/*conda3/etc/profile.d/conda.sh

## Wal
#cat ~/.cache/wal/sequences

## TexLive2017
#export PATH=$HOME/.local/texlive/2017/bin/x86_64-linux:$PATH
#export MANPATH="$HOME/.local/texlive/2017/texmf-dist/doc/man:$MANPATH"
#export INFOPATH="$HOME/.local/texlive/2017/texmf-dist/doc/info:$INFOPATH"

## Stuffs
#export EDITOR=nvim
#export BETTER_EXCEPTIONS=1

## Cargo
#export PATH=$HOME/.cargo/bin:$PATH

## Ruby
## export PATH=$(ruby -e "puts Gem.user_dir")/bin:$PATH

## Vega & Vega-lite
#export PATH=$HOME/Git/vega/bin:$HOME/Git/vega-lite/bin:$PATH

#unsetopt share_history
#fpath+=~/.zfunc

## SSH Agent
#if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#    ssh-agent > ~/.ssh-agent-thing
#fi
#if [[ "$SSH_AGENT_PID" == "" ]]; then
#    eval "$(<~/.ssh-agent-thing)" > /dev/null
#fi

## Activate conda automatically
#function _conda_auto_activate() {
#    case $(pwd) in
#        *praktikum*) ENV="base" ;;
#        *thesis*)    ENV="cta"  ;;
#        *cta*)       ENV="cta"  ;;
#        *)           ENV="none" ;;
#    esac
#    if [[ $ENV != "none" ]]; then
#        if ! [[ $(which python) =~ ".*conda.*" ]]; then
#            conda activate $ENV
#        fi
#    fi
#}
#function chpwd() {
#    _conda_auto_activate
#}

#DEFAULT_USER="noah"
#source /home/noah/MAGIC/root-6.14.04/obj/bin/thisroot.sh
#
source ~/.aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
if ! zplug check; then
    zplug install
fi
zplug load
