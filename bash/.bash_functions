# vim: ft=sh

function agent () {
    pkill -u $USER ssh-agent -e
    ssh-agent > ~/.ssh-agent-thing
    eval "$(<~/.ssh-agent-thing)"
    ssh-add ~/.ssh/id_rsa.gitlab
}
