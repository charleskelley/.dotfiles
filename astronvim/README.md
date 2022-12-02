# AstroNvim User Configuration

See [AstroNvim documentation](https://astronvim.github.io/Configuration/basic_configuration) for details.

## Usage of config directory

1. Make sure AstroNvim is installed in the `~/.config/nvim` 
2. Create a the `~/.config/astronvim/lua/user` user directory to keep config
   completely separate from git managed AstroNvim in `~/.config/nvim`
3. Use `stow --target=~/.config/astronvim/lua/user user` from this
   file's parent directory to setup link farm for user configuration changes to
   AstroNvim that will be merged with defaults

