#!/usr/bin/env zsh

source /opt/antigen/antigen.zsh

export TERM="xterm-256color" # to enable all colors used in this theme.

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle git-flow
[ -f /etc/debian_version ] && antigen bundle debian
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle sudo
antigen bundle systemd

# External bundles
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

# For Hi-Fi terminal
if tty | grep -q '/dev/pts' && [[ -z "${FORCE_LOW_FI_ZSH:-}" ]]; then
  # Customize theme
  source /etc/zsh/customize/zsh-theme.zsh
  # Load the theme.
  antigen theme bhilburn/powerlevel9k powerlevel9k
else
  antigen theme gozilla
fi

# Tell Antigen that you're done.
antigen apply
