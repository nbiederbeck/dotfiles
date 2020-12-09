# Defined in - @ line 1
function sshfs --wraps='sshfs -o reconnect,no_readahead,compression=yes,ServerAliveInterval=15,ServerAliveCountMax=3 $argv' --description 'alias sshfs=sshfs -o reconnect,no_readahead,compression=yes,ServerAliveInterval=15,ServerAliveCountMax=3 $argv'
 command sshfs -o reconnect,no_readahead,compression=yes,ServerAliveInterval=15,ServerAliveCountMax=3 $argv $argv;
end
