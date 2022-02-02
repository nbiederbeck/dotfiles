function o
    argparse h/help s/set -- $argv
    or return

    # Help
    if set -q _flag_help
        echo "Open files with their default applications or set those applications with [-s|--set]."
        return 0
    end

    # Find mimetype and set it
    if set -q _flag_set
        gio mime (mimetype $argv[1] | cut -f2 -d' ') $argv[2]
        return 0
    end

    gio open $argv
end
