function fish_prompt
    set -l cwd (string replace -r "^$HOME" '~' $PWD)
    set -l short_host (string split -m1 '.' $hostname)[1]

    set_color --bold green
    echo -n $USER@$short_host
    set_color normal
    echo -n ':'
    set_color --bold blue
    echo -n $cwd
    set_color normal
    echo -n '$ '
end
