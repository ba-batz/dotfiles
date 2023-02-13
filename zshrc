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
alias zshist='mkdir ~/.cache/zsh; touch ~/.cache/zsh/history'
alias win='sudo systemctl reboot -f --boot-loader-entry=auto-windows'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 1>/dev/null

# Added by ProtonUp-Qt on 01-11-2022 21:29:17
if [ -d "/home/pik/stl/prefix" ]; then export PATH="$PATH:/home/pik/stl/prefix"; fi
