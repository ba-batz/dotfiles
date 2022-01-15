# DESCRIPTION:
#   A simple zsh configuration that gives you 90% of the useful features that I use everyday.
#
# AUTHOR:
#   Geoffrey Grosenbach http://peepcode.com


# Colors
autoload -U colors
colors
PS1="%B%{$fg[red]%}[%{$fg[blue]%}%n%{$fg[blue]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Aliases
alias nf='neofetch'
alias stk='mangohud --dlsym gamemoderun supertuxkart'

# Basic auto/tab complete:
 autoload -U compinit
 zstyle ':completion:*' menu select
 zmodload zsh/complist
 compinit
 _comp_options+=(globdots)

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 1>/dev/null
