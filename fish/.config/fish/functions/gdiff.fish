# Defined in - @ line 1
function gdiff --wraps='git diff $argv' --description 'alias gdiff=git diff $argv'
  git diff $argv $argv;
end
