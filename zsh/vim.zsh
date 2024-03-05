#!/bin/sh
# adapted from https://github.com/zap-zsh/vim/blob/master/vim.plugin.zsh
bindkey -v
export KEYTIMEOUT=1

if [[ -o menucomplete ]]; then 
    # Use hjlk in menu selection (during completion)
    bindkey -M menuselect '^h' vi-backward-char
    bindkey -M menuselect '^p' vi-up-line-or-history
    bindkey -M menuselect '^n' vi-down-line-or-history
    bindkey -M menuselect '^l' vi-forward-char

    bindkey -M menuselect '^f' history-incremental-search-forward
    bindkey -M menuselect '^i' vi-insert 
fi

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Add text objects for quotes and brackets.
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for m in viopp visual; do
  for c in {a,i}{\',\",\`}; do
      bindkey -M $m -- $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
      bindkey -M $m -- $c select-bracketed
  done
done

# Add surround like commands.
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround
# escape back into normal mode
if [[ -n "${VI_MODE_ESC_INSERT}" ]] then
    bindkey -M viins "${VI_MODE_ESC_INSERT}" vi-cmd-mode
fi
