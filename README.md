# Neovim Configuration

## Dependencies (assumes Ubuntu)
- neovim (obviously)
```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```
or build from source
```
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
make install
```
- ripgrep (for telescope)
```
sudo apt-get install ripgrep
```
