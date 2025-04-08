ZSH_DISABLE_COMPFIX=true

ZSH=$HOME/.oh-my-zsh

# Enable brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# You can change the theme with another one 
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="agnoster"

# Load rbenv if installed
export PATH="${HOME}/.rbenv/bin:${PATH}"
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Node.js and NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Python setup
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
command -v poetry >/dev/null && poetry config virtualenvs.in-project true

# Plugins and generic ZSH setup
plugins=(zsh-autosuggestions z git gitfast last-working-dir common-aliases zsh-syntax-highlighting history-substring-search ssh-agent pyenv)
setopt correct_all

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Add VS Code command to Path
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# Agnoster prompt setup
prompt_context() {
  if [[ -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

prompt_dir() {
  prompt_segment blue black '%2~'
}

prompt_aws(){}

# Kubectl autocomplete
# if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi

# Start DB processes - UNCOMMENT RELEVANT ROW
# sudo systemctl start mongod # MongoDb

# THIS SHOULD ALWAYS BE LAST SECTION OF CONFIG FILE
# Source job specific config
# e.g. source ~/.deliverooconfig
export ORGANISATION=complexio
source ~/.complexio.sh
