# Dev Environment Setup Instructions

## MacOS

### SSH and Github

```bash
# Generate SSH key (use work email if needed)
ssh-keygen -t ed25519 -C {EMAIL}
# Add ssh key to ssh-agent
eval "$(ssh-agent -s)"
mkdir ~/.ssh
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
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
vim ~/.ssh/id_ed25519.pub
```

Copy the key that shows up and add to GitHub

### Add a new config file for the job (i.e. Deliveroo)

```zsh
~
zshconfig
# edit "ORGANISATION=<<NAME_OF_COMPANY>>" and "source ~/.NAME_OF_COMPANY.sh"
exec zsh
touch ~/.${ORGANISATION}.sh
aliasconfig
# edit "companyconfig=~/.NAME_OF_COMPANY.sh"
exec zsh
```

- This is only required the first time setting up for a new company, for subsequent devices just run:

```zsh
~
cd ~
touch .${ORGANISATION}.sh
exec zsh
```

### Clone and install setup

```bash
mkdir ~/code
cd ~/code
git clone git@github.com:giovanni-fantini/setup.git
zsh setup/install.sh
```

The install script will automatically:

- Create symlinks for all configuration files
- Install required zsh plugins
- Install essential development tools from `Brewfile` (macOS only)
- Create necessary directories
- Reload your shell configuration

**Note**: The Brewfile only installs essential tools and applications (casks) not available by default on macOS. Optional tools like databases and utilities are commented out and can be installed separately if needed. Uncomment and rerun `brew bundle`. The script skips Brewfile installation on non-macOS systems (like WSL).

### Install homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Shell setup

```bash
which zsh || brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh) # mostly not needed
```

### iTerm2 setup

```zsh
~
brew install --cask iterm2
```

- Agnoster is the theme of choice. It's already selected in the zshrc
- Open iTerm and import mac_iterm_profile.json

### IDE setup

- [Install VS Code](https://code.visualstudio.com/docs?dv=osx)
- Go to Settings Sync -> Configure
- [Install Cursor](https://cursor.com/downloads)

### Install Pyenv and latest stable Python (3.13 at time of writing)

```zsh
~
brew install pyenv
pyenv install 3.13
pyenv global 3.13
exec zsh
pip install poetry
pip install --upgrade pip
```

### Install rbenv, LTS Ruby + bundler & rails

```zsh
~
brew install rbenv
rbenv install -l
rbenv install VERSION
rbenv global VERSION
gem install bundler
gem install rails
```

### Install NVM and latest stable Node.js

```zsh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install --lts
npm install -g typescript
```

### Install databases

```zsh
```

### Install Docker

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

### SSH and Github

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

### Install rbenv, LTS Ruby + bundler & rails

```zsh
sudo apt install libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
rbenv install -l
rbenv install VERSION
rbenv global VERSION
gem install bundler
gem install rails
```

### Install NVM, LTS Node.js and TS

```zsh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install --lts
npm install -g typescript
```

### Install databases

```zsh
```

### Install Docker

- Install Docker Desktop for Windows
- Turn on "Use WSL 2 based engine" in settings

### Add a new config file for the job (i.e. Deliveroo)

```zsh
~
cd ~
echo 'export ORGANISATION=name_of_company' >> ~/.zshrc
exec zsh
touch .${ORGANISATION}.sh
echo "alias ${ORGANISATION}config=vim ~/.${ORGANISATION}.sh" >> ~/.aliases
echo "source ~/.${ORGANISATION}.sh" >> ~/.zshrc
exec zsh
```

---

## AI Development Configuration

This setup includes AI-assisted development tools and Git worktree helpers for parallel development with Cursor agents. The workflow allows you to work on multiple tasks simultaneously while maintaining clean separation and easy PR management.

### Configuration Files

- `~/.aiconfig` - AI development configuration (worktrees, Cursor integration, etc.)
- `~/.aliases` - General shell aliases
- `~/.zshrc` - Main shell configuration

### Quick Configuration

```bash
# Edit AI configuration
aiconfig

# Edit shell aliases  
aliasconfig

# Edit main shell config
zshconfig
```

**Note**: The `aiconfig` file is automatically symlinked to `~/.aiconfig` during installation, so the AI worktree helpers will be available immediately after setup.

### Quick Start

```bash
# Create a new worktree for a feature
wt-new feature-branch

# Navigate to the worktree
wt-enter feature-branch

# Clean up after merge
wt-clean feature-branch
```

### Available Commands

**Core Worktree Management:**

- `wt-new <branch>` - Create a new worktree with dynamic repository detection, smart dependency installation, and environment file setup
- `wt-enter <branch>` - Navigate to an existing worktree
- `wt-clean <branch>` - Remove worktree and delete branch (after merge)
- `wt-list` - List all active worktrees
- `wt-info` - Show repository information and project type
- `wt-rename <old> <new>` - Rename worktree to avoid path length issues (prevents overmind/tmux errors)

**Cursor Integration:**

- `cursor-open-worktree <branch>` - Open worktree directly in Cursor

**Troubleshooting & Diagnostics:**

- `wt-diagnose` - Detailed worktree diagnostics and configuration analysis
- `ai-setup` - Check AI development environment setup and list all available commands

### Complete Workflow

1. **Start a new task:**

     ```bash
     wt-new feature-branch
     ```

     This creates `../project-name-wt-feature-branch` (sibling to main repo) with a new branch off the detected default branch (main/master), automatically detects project type, installs dependencies (Ruby, Node.js, Python with Poetry/pip, etc.), and copies environment files (.env or .env.example) from the main repository.

2. **Point Cursor to the worktree:**

   ```bash
   cursor-open-worktree feature-branch
   ```

   Or manually open Cursor in the worktree

3. **Work in parallel:**
   - You work in your main workspace
   - Cursor agents work in the worktree
   - Each has its own clean working directory

4. **Review and commit changes:**

   ```bash
   wt-enter feature-branch
   git status
   git add -A
   git commit -m "feat: implement new feature"
   ```

5. **Keep branch fresh:**

   ```bash
   git fetch origin
   git rebase origin/main
   ```

6. **Push and create PR:**

   ```bash
   git push origin feature-branch
   gh pr create --base main --head feature-branch \
     --title "feat: implement new feature" \
     --body "Implements new feature with tests and documentation."
   ```

7. **Clean up after merge:**

   ```bash
   # From your main workspace (not inside the worktree)
   wt-clean feature-branch
   ```

### Stash Behavior

All worktrees share the same stash stack because they share the same `.git` directory. Best practices:

- Tag stashes with worktree name: `git stash push -m "wt-search-sorting: WIP parser tweak"`
- Prefer small commits over stashes when multiple worktrees are active
- Apply stashes back in the same worktree they came from

### Smart Features

**Core Functionality:**

- **Dynamic Repository Detection**: Automatically detects default branch (main/master) and remote URL
- **Multi-Language Support**: Detects and installs dependencies for Ruby, Node.js, and Python projects
- **Python Support**: Prioritizes Poetry (`pyproject.toml`) over pip (`requirements.txt`)
- **Environment Setup**: Automatically copies `.env` file from main repository, or `.env.example` as fallback
- **Project Type Detection**: Use `wt-info` to see repository information and detected project type
- **Cursor Integration**: Direct worktree opening with `cursor-open-worktree`

**Path Length Management:**

- **Automatic Truncation**: Branch names longer than 30 characters are automatically truncated to prevent overmind/tmux socket path issues
- **Smart Renaming**: `wt-rename` function properly handles worktree reconfiguration without corruption
- **Corruption Prevention**: Built-in safeguards prevent the "cannot chdir" errors that occur with manual directory renaming

**Error Handling:**

- **Corruption Detection**: `wt-diagnose` provides detailed analysis of worktree state
- **Manual Cleanup**: For corrupted worktrees, use `wt-diagnose` to identify issues, then manually clean up `.git/worktrees/` and `.git/config` as needed

### Troubleshooting

**Common Issues:**

- **Detached HEAD**: Always create worktrees with `-b <branch>` or switch to a branch before committing
- **Pushing wrong base**: Start from detected default branch and run `git rebase origin/main` before pushing
- **Can't delete branch**: Remove the worktree first with `wt-clean`
- **Pre-commit hooks**: Ensure Node/Poetry/etc. installs happen inside the worktree
- **Unknown project type**: Use `wt-info` to check what was detected, or manually install dependencies
- **Missing environment variables**: Check if `.env` or `.env.example` exists in main repository, or manually copy environment files

**Worktree Issues & Resolution:**

- **Path Length Issues**: Worktree names are automatically truncated to 30 characters to prevent overmind/tmux socket path issues
- **Corruption Prevention**: Always use `wt-rename <old> <new>` instead of manually renaming worktree directories
- **"cannot chdir" Errors**: Usually indicates corrupted git worktree configuration

**Manual Cleanup Procedure:**

1. Run `wt-diagnose` to identify corrupted worktree entries
2. Remove corrupted entries from `.git/worktrees/` directory  
3. Check `.git/config` for any `worktree = <path>` lines pointing to non-existent paths and remove them
4. Use `wt-new` to recreate the worktree with a proper short name

---

## Improvements

- Import packages files (shell, ruby, python, node)
- Add all steps to install script
- Split install script for WSL and Mac
