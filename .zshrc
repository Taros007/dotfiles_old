bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tano/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT='%F{red}%n%f@%F{blue}%m%f %F{yellow}%1~%f %# '

#add historical tab completion

#autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search

#[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
#[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

export VISUAL="vim"
alias gitconfig='/usr/bin/git --git-dir=/home/tano/.gitcfg/ --work-tree=/home/tano'

# history stuff
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# fix zsh annoying history behavior
h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

#Stubru alias
alias stubru="mpv 'https://live-radio.lwc.vrtcdn.be/groupc/live/f404f0f3-3917-40fd-80b6-a152761072fe/live.isml/.m3u8'"

# Lazygit implementation
function lazygit() {
    if [ $# -eq 0 ]; then
        git pull
    else
        git add .
        git commit -a -m "$1"
        git push
    fi
}

