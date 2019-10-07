# vim: ft=sh
function fish_prompt
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)

    # set_color blue
    # printf '%s' (__fish_git_prompt)
    # set_color red
    # printf '%s' (__fish_git_prompt_informative_status)

    set_color normal
    # Line 2
    echo
    if test $VIRTUAL_ENV
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    printf '$ '
    set_color normal
end
