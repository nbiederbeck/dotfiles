# Defined in - @ line 1
function gits --wraps='git status --short' --description 'alias gits=git status --short'
  git status --short $argv;
end
