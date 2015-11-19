# completion
autoload -U compinit
compinit

# enviroment variable
export LANG=ja_JP.UTF-8
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt share_history

# emacs like keybind
bindkey -e

# beep off
setopt nolistbeep

# 
unsetopt promptcr

# alias
[ -f ~/.alias ] && source ~/.alias

# googletest
export GTEST_COLOR=1

# for rbenv
export PATH=~$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# for pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# for virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
