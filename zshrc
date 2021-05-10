ZSH_DISABLE_COMPFIX=true

ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one 
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="agnoster"

# Plugins and generic ZSH setup
plugins=(zsh-autosuggestions z git gitfast last-working-dir common-aliases zsh-syntax-highlighting history-substring-search ssh-agent)
setopt correct_all

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# Load rbenv if installed
export PATH="${HOME}/.rbenv/bin:${PATH}"
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# uncomment for WSL
# export DISPLAY=:0
# sudo /etc/init.d/postgresql start

# Terminal colors for WSL
# if [ -f ~/.dir_colors ]; then  
#   eval `dircolors ~/.dir_colors`
# fi

# Agnoster prompt setup
prompt_context() {
  if [[ -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

prompt_dir() {
  prompt_segment blue black '%2~'
}

# Kubectl autocomplete
if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi

# Python related
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

