# Dev Environment Setup Instructions
## MacOS
### Git & Github
```zsh
# Generate SSH key (use work email if needed)
ssh-keygen -t ed25519 -C "fantini.giovanni@gmail.com"
# Add ssh key to ssh-agent
eval "$(ssh-agent -s)"
touch ~/.ssh/config
vim ~/.ssh/config
```
Paste the following in the file:
```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```
Run
```zsh
ssh-add -K ~/.ssh/id_ed25519
```

Finally add the key to Github SSH key settings (turn SSO on if required)

### Install homebrew
```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
### Install iTerm2
```zsh
brew install --cask iterm2
```
### Zsh + Oh-my-zsh installs
```zsh
which zsh || brew install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
### Install Rbenv and latest stable Ruby (3.0.1 at time of writing)
```zsh
brew install rbenv
rbenv install 3.0.1
rbenv global 3.0.1
```
### Installation script
- Run installation script (to be modified with full setup)
```zsh
cd setup
zsh install.sh
```
### Agnoster theme + powerline fonts installs
- Agnoster is the theme of choice. It's already selected in the zshrc
- Fetch the fonts repo using `git submodule init && git submodule update`
- Open .itermcolors file
### Add iterm profile
- Import mac_iterm_profile.json in iTerm
### VS Code
- [Install VS Code](https://code.visualstudio.com/docs?dv=osx)
- Go to Settings Sync -> Configure
- Go to Shell command: add code command in Path
### Add bundler and Rails
```zsh
~
gem install bundler
gem install rails
```

### Add a new config file for the job (i.e. Deliveroo)
```zsh
~
touch .deliveroo.sh
echo 'alias deliverooconfig="vim ~/.deliveroo.sh' >> ~/.aliases
echo 'source ~/.deliveroo.sh' >> ~/.zshrc
```
### Online guides and resources:
- MacOS guide for terminal customization: https://gist.github.com/kevin-smets/8568070
- Powerline fonts: https://github.com/powerline/fonts/
- Zsh-autosuggestions: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
- VS Code for Mac: https://code.visualstudio.com/docs/setup/mac
---
## WSL

### Online guides and resources
- Linux guide for terminal customization: https://maxim-danilov.github.io/make-linux-terminal-great-again/