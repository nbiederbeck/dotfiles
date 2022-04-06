function qr
    argparse h/help -- $argv
    or return

    if set -q _flag_help
        return 1
    end

    set data $argv[1]

    set output $argv[2]
    set type (string split . $output | tail -1)

    switch $type
    case png
        set accept "image/png"
    case '*'
        echo "Unsupported type '$type'"
        return 1
    end

    curl -s https://qrcode.show -d "$data" -H "Accept: $accept" --output "$output"
end
