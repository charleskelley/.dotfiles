# Default editor is Neovim
set -gx EDITOR nvim

# Vim mode
fish_vi_key_bindings

# Load fish command aliases abbreviations for common shortcuts
source $HOME/.config/fish/abbr.fish

# Configure Homebrew
eval (/opt/homebrew/bin/brew shellenv)

# Starhip prompt
starship init fish | source

# asdf polyglot runtime manager
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/mambaforge/base/bin/conda "shell.fish" "hook" $argv | source

if test -f "/opt/homebrew/Caskroom/mambaforge/base/etc/fish/conf.d/mamba.fish"
    source "/opt/homebrew/Caskroom/mambaforge/base/etc/fish/conf.d/mamba.fish"
end
# <<< conda initialize <<<

