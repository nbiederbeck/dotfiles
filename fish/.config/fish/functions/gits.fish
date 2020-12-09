# Defined in - @ line 1
function gits --wraps='git status --short $argv' --description 'alias gits git status --short $argv'
  git status --short $argv $argv;
end
