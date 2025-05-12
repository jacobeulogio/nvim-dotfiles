Personal neovim configuration 

```sh
git clone https://github.com/jacobeulogio/nvim-dotfiles.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>
<details><summary>WSL (Windows Subsystem for Linux)</summary>

```
wsl --install
wsl
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>
