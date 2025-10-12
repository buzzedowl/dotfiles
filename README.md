This repo helps track the journey of building my ideal development environment!  
I like to keep things close to default, portable, easy to maintain and not to mention looking good :)  
My aim is minimal friction between having a thought and building it. 

### whats in here ?
- [Neovim](https://github.com/neovim/neovim) + [Tmux](https://github.com/tmux/tmux) (my swiss army knives!)
- [Ghostty](https://github.com/ghostty-org/ghostty), [Aerospace](https://github.com/open-aerospace), zshrc ...
- Custom scripts and other configs

![Dotfiles Preview](https://github.com/TamerHamdan/repo-media/blob/main/dotfiles/dotfilesV2.png?raw=true)

<details><summary><h3>More Screenshots</h3></summary>
  
![Dotfiles Preview](https://github.com/TamerHamdan/repo-media/blob/main/dotfiles/dotfilesV2-etc.png?raw=true)

</details>

### Usage / Installation  

First, install `stow` using your package manager : 

<details>
<summary>macOS</summary>

```bash
brew install stow
```
</details>

<details>
<summary>Linux</summary>

```bash
# Ubuntu/Debian
sudo apt-get update && sudo apt-get install stow

# Fedora
sudo dnf install stow

# Arch Linux
sudo pacman -S stow
```
</details>

Then clone this repo and use [`stow`](https://www.gnu.org/software/stow/) to symlink the dotfiles:

```bash
git clone https://github.com/buzzedowl/dotfiles.git ~
cd dotfiles
stow .
```
Feel free to look around, fork, or contribute!
