# Defined in - @ line 1
function gits --description 'alias gits git status --short $argv'
  git status --short $argv $argv;
end
