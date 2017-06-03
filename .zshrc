# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tano/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT='%F{red}%n%f@%F{blue}%m%f %F{yellow}%1~%f %# '

export VISUAL="vim"
alias gitconfig='/usr/bin/git --git-dir=/home/tano/.gitcfg/ --work-tree=/home/tano'
