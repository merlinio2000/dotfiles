#!/bin/zsh


# based on this guide https://thevaluable.dev/zsh-completion-guide-examples/
zmodload zsh/complist
# Enable the "new" completion system (compsys).
autoload -Uz compinit && compinit
_comp_options+=(globdots) # With hidden files

# zstyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>
# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate

# Allow you to select in a menu
zstyle ':completion:*' menu select

zstyle ':completion:*' file-sort modification

# See ZSHCOMPWID "completion matching control"
# allows completion of partial matches
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompcache"

zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

# ls colors for file/directory results
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# group results
zstyle ':completion:*' group-name ''

