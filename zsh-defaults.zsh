#!/usr/bin/env zsh

source /opt/antigen/antigen.zsh

export TERM="xterm-256color" # to enaable all colors used in this theme.

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle git-flow
antigen bundle heroku
antigen bundle pip
antigen bundle docker
antigen bundle vagrant
antigen bundle mvn
antigen bundle gradle
antigen bundle gem
antigen bundle rvm
antigen bundle bundler
antigen bundle debian
antigen bundle emoji-clock
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle emoji
antigen bundle sudo
antigen bundle command-not-found
antigen bundle asdf

# External bundles
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

# For Hi-Fi terminal
if tty | grep -q '/dev/pts'; then
  # Customize theme
  source /etc/zsh/customize/zsh-theme.zsh
  # Load the theme.
  antigen theme bhilburn/powerlevel9k powerlevel9k
else
  antigen theme robbyrussell
fi

# Tell Antigen that you're done.
antigen apply
