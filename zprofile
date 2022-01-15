

# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == linux-gnu ]]; then
  export BROWSER='chromium'
  fi

  #
  # Editors
  #

  export EDITOR='vim'
  export VISUAL='vim'
  export PAGER='less'

  #
  # Language
  #

  if [[ -z "$LANG" ]]; then
    export LANG='en_US.UTF-8'
    fi

    #
    # Paths
    #

    # Ensure path arrays do not contain duplicates.
    typeset -gU cdpath fpath mailpath path


        #
        # Less
        #

        # Set the default Less options.
        # Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
        # Remove -X and -F (exit if the content fits on one screen) to enable it.
        export LESS='-F -g -i -M -R -S -w -X -z-4'

        # Set the Less input preprocessor.
        if (( $+commands[lesspipe.sh] )); then
          export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
	fi

startx
