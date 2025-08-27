backup() {
  target=$1
  if [ -e "$target" ]; then           # Does the config file already exist?
    if [ ! -L "$target" ]; then       # as a pure file?
      mv "$target" "$target.backup"   # Then backup it
      echo "-----> Moved your old $target config file to $target.backup"
    fi
  fi
}

#!/bin/zsh
for name in *; do
  if [ ! -d "$name" ]; then
    target="$HOME/.$name"
    if [[ ! "$name" =~ '\.sh$' ]] && [ "$name" != 'README.md' ] && [ "$name" != 'install.sh' ]; then
      backup $target

      if [ ! -e "$target" ]; then
        echo "-----> Symlinking your new $target"
        ln -s "$PWD/$name" "$target"
      fi
    fi
  fi
done

REGULAR="\\033[0;39m"
YELLOW="\\033[1;33m"
GREEN="\\033[1;32m"

# zsh plugins
CURRENT_DIR=`pwd`
ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  echo "-----> Installing zsh plugin 'zsh-syntax-highlighting'..."
  git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
fi
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-autosuggestions" ]; then
  echo "-----> Installing zsh plugin 'zsh-autosuggestions'..."
  git clone git@github.com:zsh-users/zsh-autosuggestions.git
fi
cd "$CURRENT_DIR"

# Install dependencies from Brewfile (macOS only)
if [[ "$OSTYPE" == "darwin"* ]] && command -v brew >/dev/null; then
  echo "-----> Installing dependencies from Brewfile..."
  brew bundle --file="$PWD/Brewfile"
elif [[ "$OSTYPE" == "darwin"* ]] && ! command -v brew >/dev/null; then
  echo "-----> Homebrew not found on macOS. Please install Homebrew first:"
  echo "      /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
  echo "      Then rerun this install script."
elif [[ "$OSTYPE" != "darwin"* ]]; then
  echo "-----> Skipping Brewfile installation (not on macOS)"
fi

# create TerminalLogs dir
mkdir "$HOME/TerminalLogs"

source ~/.zshrc
