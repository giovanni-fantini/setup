# Dev Environment Setup Instructions

## MacOS

### Git & Github

```bash
# Generate SSH key (use work email if needed)
ssh-keygen -t ed25519 -C {EMAIL}
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

```bash
ssh-add -K ~/.ssh/id_ed25519
vim ~/.ssh/id_ed25519.pub
```

Copy the key that shows up and add to GitHub

### Install homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Shell setup

```bash
which zsh || brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)
```

### Installation script

```zsh
~
mkdir code
cd code
git clone git@github.com:giovanni-fantini/setup.git
zsh install.sh
```

### iTerm2 setup

- Agnoster is the theme of choice. It's already selected in the zshrc

```zsh
~
brew install --cask iterm2
cd ~/code/setup/assets
git submodule init && git submodule update
```

- Open .itermcolors file
- Import mac_iterm_profile.json in iTerm

### VS Code setup

- [Install VS Code](https://code.visualstudio.com/docs?dv=osx)
- Go to Settings Sync -> Configure
- Go to Shell command: add code command in Path

### Install Rbenv and latest stable Ruby (3.0.1 at time of writing)

```zsh
~
brew install rbenv
rbenv install 3.0.1
rbenv global 3.0.1
```

### Add bundler and Rails

```zsh
~
gem install bundler
gem install rails
```

### Install Pyenv and latest stable Python (3.10.x at time of writing)

```zsh
~
brew install pyenv
pyenv install 3.10
pyenv global 3.10.x
pip install pipenv
```

### Install NVM and latest stable Node.js

```zsh
```

### Install databases

```zsh
```

### Add a new config file for the job (i.e. Deliveroo)

```zsh
~
touch .{ORGANISATION}.sh
echo 'alias {ORGANISATION}config="vim ~/.deliveroo.sh' >> ~/.aliases
echo 'source ~/.{ORGANISATION}.sh' >> ~/.zshrc
```

### Online guides and resources

- MacOS guide for terminal customization: <https://gist.github.com/kevin-smets/8568070>
- Powerline fonts: <https://github.com/powerline/fonts/>
- Zsh-autosuggestions: <https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh>
- VS Code for Mac: <https://code.visualstudio.com/docs/setup/mac>

---

## WSL

### Installation

- Enable WSL
- Install Ubuntu via Microsoft Store

```PowerShell
wsl --set-default-version 2
wsl --set-default Ubuntu
```

### Ubuntu setup

- Add UNIX user: gio

```PowerShell
Ubuntu config --default-user gio
```

### Git & Github

```bash
# Generate SSH key (use work email if needed)
ssh-keygen -t ed25519 -C {EMAIL}
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

```bash
ssh-add -K ~/.ssh/id_ed25519
vim ~/.ssh/id_ed25519.pub
```

Copy the key that shows up and add to GitHub

### Shell setup

```bash
~
sudo apt update
sudo apt upgrade
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)
```

### Installation script

```zsh
~
mkdir code
cd code
git clone git@github.com:giovanni-fantini/setup.git
zsh install.sh
```

### Windows Terminal setup

- Install Windows Terminal via Microsoft Store
- Agnoster is the theme of choice. It's already selected in the zshrc

```PowerShell
Remove-Item -Path $Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -Force –Recurse
New-Item -ItemType SymbolicLink -Path "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Target "\\wsl.localhost\Ubuntu\home\gio\code\setup\assets\windows_terminal_profile.json"
```

### Install Pyenv and latest stable Python (3.12.4 at time of writing)

```zsh
curl https://pyenv.run | bash
sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
pyenv install 3.12.4
pyenv global 3.12.4
pip install poetry
```

### Install NVM and latest stable Node.js

```zsh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install --lts
```

### Install DBs (MongoDb & PostgreSQL)

```zsh
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt install -y mongodb-org
sudo apt install postgresql
```

---

## Improvements

- Import packages files (shell, ruby, python, node)
- Add all steps to install script
- Split install scrit for WSL and Mac
