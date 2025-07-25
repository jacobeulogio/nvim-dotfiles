
# Neovim Configuration

My personal neovim configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

## Features

### Python Development

- **Slime**: Send code from Neovim to a REPL in another tmux pane. Used with ipython
- **Venv Select**: Easily select Python virtual environments.
- **LSP**: Code completion, diagnostics, and other language features via `ruff and pylsp`.

### SQL Development

- **vim-dadbod**: A database UI for Neovim.

### Other Features

- **Telescope**: A highly extendable fuzzy finder.
- **TFM**: A terminal file manager plugin.
- **vim-fugitive**: A Git wrapper for Neovim.
- **CSV View**: View CSV files similar to spreadsheets.

## Installation

Linux


```sh

git clone https://github.com/jacobeulogio/nvim-dotfiles.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

```

WSL

```

wsl --install
wsl
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim

```

