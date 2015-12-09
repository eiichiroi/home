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
if [ -f ~/.alias ]; then
    source ~/.alias
fi

# googletest
export GTEST_COLOR=1

# ssh-agent for screen detach
agent=$HOME/.ssh/ssh-agent-$USER
if [ -S $SSH_AUTH_SOCK ]; then
    case $SSH_AUTH_SOCK
    in /tmp/*/agent.[0-9]*)
	   ln -snf $SSH_AUTH_SOCK $agent && export SSH_AUTH_SOCK=$agent
    esac
elif [ -S $agent ]; then
    export SSH_AUTH_SOCK=$agent
else
    # remove if this config move to zprofile
    echo "no ssh-agent"
fi

# for rbenv
if [ -e $HOME/.rbenv ]; then
   export PATH=~$HOME/.rbenv/bin:$PATH
   eval "$(rbenv init -)"
fi

# for pyenv
if [ -e $HOME/.pyenv ]; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
fi

# for virtualenvwrapper
if [ -e $HOME/.virtualenvs ]; then
    export WORKON_HOME=$HOME/.virtualenvs
fi
