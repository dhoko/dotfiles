# Defined prompt only if is not already defined
if [ ! -z "$PS1" ]; then
        if [ -r ~/.bashrc.d/bashrc_prompt ]; then
            source ~/.bashrc.d/bashrc_prompt
    fi
fi

# Global aliases
if [ -r ~/.bashrc.d/bashrc_aliases ]; then
        source ~/.bashrc.d/bashrc_aliases
fi

export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh
export GPG_TTY=$(tty)
export GPG_TTY=$(tty)
. /home/dhoko/scripts/z.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash