# Defined in - @ line 1
function sshfs
  command sshfs -o reconnect,no_readahead,compression=yes,ServerAliveInterval=15,ServerAliveCountMax=3 $argv;
end