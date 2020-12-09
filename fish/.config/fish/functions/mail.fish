# Defined in - @ line 1
function mail --wraps='alacritty --title Apline --command alpine' --description 'alias mail alacritty --title Apline --command alpine'
  alacritty --title Apline --command alpine $argv;
end
