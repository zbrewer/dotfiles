#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
   . ~/.bash_aliases
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias wgethtml='wget -E -H -k -K -p'
PS1='[\u@\h \W]\$ '

export PATH="$HOME/play:$HOME/bin:/opt/java6/bin:$HOME/eclipse:/opt/h2/bin:$PATH"

# Set the terminal to uxterm (so that i3-sensible-terminal launches
# uxterm which, unlike xterm supports UTF-8 encoding
export TERMINAL=uxterm

# Set the editor to vim
export EDITOR=vim

function prompt
{
   local WHITE="\[\033[1;37m\]"
   local GREEN="\[\033[0;32m\]"
   local CYAN="\[\033[0;36m\]"
   local GRAY="\[\033[0;37m\]"
   local BLUE="\[\033[0;34m\]"
   local RED="\[\033[0;31m\]"
   local LIGHTBLUE="\[\033[1;34m\]"
   local LIGHTPURPLE="\[\033[1;35m\]"
   local PURPLE="\[\033[0;35m\]"
   local LIGHTGREEN="\[\033[1;32m\]"
   local LIGHTRED="\[\033[1;31m\]"
   local DARKGREY="\[\033[1;30m\]"
   local YELLOW="\[\033[1;33m\]"
   local LIGHTCYAN="\[\033[1;36m\]"
   local BROWN="\[\033[0;33m\]"
   local LIGHTGREY="\[\033[0;37m\]"
   local BLACK="\[\033[0;30m\]"

export PS1="
${LIGHTBLUE}\d ${LIGHTPURPLE}\@ ${CYAN}\u${GREEN}@${RED}\h ${PURPLE}\w${GRAY}
$ "

}

prompt
