function mountremote
    if test (count $argv) -gt 1
        echo "Too many arguments (try 1)."
        return 1
    end

    set -l host (string split : $argv -f1)
    set -l dir ~/mounts/$host
    mkdir -p $dir

    sshfs -o auto_cache,no_readahead,reconnect,ServerAliveInterval=30,ServerAliveCountMax=2 $argv $dir || echo "Already mounted"; return 1

    echo mounted at $dir
    return
end
