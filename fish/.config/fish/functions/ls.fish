# Defined via `source`
function ls --wraps=exa --description 'alias ls=exa'
  exa --icons $argv; 
end
