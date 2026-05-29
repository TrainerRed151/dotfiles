if not status is-interactive
    return
end

set -g fish_greeting ''

# Disable autosuggestions
set -g fish_autosuggestion_enabled 0

# Disable syntax highlighting
set -g fish_color_command normal
set -g fish_color_error normal
set -g fish_color_param normal
set -g fish_color_quote normal
set -g fish_color_comment normal
set -g fish_color_operator normal
set -g fish_color_escape normal
set -g fish_color_end normal
set -g fish_color_redirection normal
set -g fish_color_autosuggestion normal

# PATH
fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin

set -gx EDITOR nvim

# pyenv
set -gx PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

if command -q pyenv
    pyenv init - fish | source
    pyenv virtualenv-init - | source
end

fastfetch
~/.local/bin/mise activate fish | source
