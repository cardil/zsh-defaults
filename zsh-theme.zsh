#!/usr/bin/env zsh

# ============================================================================
# Powerlevel10k Configuration
# ============================================================================
# Requires: Nerd Font (e.g., JetBrainsMono Nerd Font)
# Reference: https://github.com/romkatv/powerlevel10k

# ----------------------------------------------------------------------------
# Instant Prompt
# ----------------------------------------------------------------------------
# Enable Powerlevel10k instant prompt for faster shell startup.
# Should be at the very top of ~/.zshrc for full effect.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use Nerd Fonts for icons
typeset -g POWERLEVEL9K_MODE='nerdfont-v3'

# ----------------------------------------------------------------------------
# Prompt Elements
# ----------------------------------------------------------------------------
# Left prompt (2 lines):
# Line 1: OS icon, directory, lock, root badge, git status
# Line 2: prompt char only (full width for commands)
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  os_icon
  dir
  dir_writable
  root_indicator
  vcs
  # newline
  # prompt_char
)
# Right prompt (line 1 only): context indicators, status, duration, jobs
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status
  command_execution_time
  background_jobs
  virtualenv
  go_version
  java_version
  node_version
  kubecontext
)
# Show language versions only in project directories
typeset -g POWERLEVEL9K_JAVA_VERSION_PROJECT_ONLY=true
typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true
# Virtualenv: show directory path instead of name
typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
# Display relative path to venv (relative to PWD, or ~/... if outside PWD)
typeset -g POWERLEVEL9K_VIRTUALENV_CONTENT_EXPANSION='${${VIRTUAL_ENV#$PWD/}/#$HOME/~}'
# Kubecontext: show only cluster name (shortened) + namespace if not default
typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_DEFAULT_NAMESPACE=false
typeset -g POWERLEVEL9K_KUBECONTEXT_SHORTEN_TO=1  # truncate cluster name
# Custom content: cluster:namespace (or just cluster if namespace=default)
typeset -g POWERLEVEL9K_KUBECONTEXT_CONTENT_EXPANSION='${P9K_KUBECONTEXT_CLUSTER##*/}${${P9K_KUBECONTEXT_NAMESPACE:#default}:+:${P9K_KUBECONTEXT_NAMESPACE}}'
# Add context (user@host) on non-laptop machines (no lid = desktop/server)
if ! [[ -d '/proc/acpi/button/lid' ]]; then
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS+=(context)
fi

# Preserve icon spacing from Powerlevel9k
typeset -g POWERLEVEL9K_LEGACY_ICON_SPACING=true

# ----------------------------------------------------------------------------
# Directory Truncation
# ----------------------------------------------------------------------------
# Truncate each directory to first character, except the last one
# Example: /home/user/projects/myapp → /h/u/p/myapp
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=""

# ============================================================================
# True Color Palette (24-bit RGB) - Dracula Theme
# ============================================================================
# Official Dracula palette: https://draculatheme.com/contribute
# Requires terminal with true color support (most modern terminals)

# ----------------------------------------------------------------------------
# OS Icon
# ----------------------------------------------------------------------------
typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND='#BD93F9'  # Purple
typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND='#282A36'  # Background

# ----------------------------------------------------------------------------
# Directory
# ----------------------------------------------------------------------------
typeset -g POWERLEVEL9K_DIR_FOREGROUND='#F8F8F2'           # Foreground
typeset -g POWERLEVEL9K_DIR_BACKGROUND='#5472bb'           # Comment (muted blue)
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND='#F8F8F2'    # Foreground (current dir)
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND='#929dc0' # Dimmed foreground
typeset -g POWERLEVEL9K_DIR_PATH_SEPARATOR_FOREGROUND='#929dc0'
typeset -g POWERLEVEL9K_DIR_PATH_SEPARATOR='/'
# Dim path separator to match shortened directory names

# ----------------------------------------------------------------------------
# Directory Writable (Lock Icon)
# ----------------------------------------------------------------------------
typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND='#953d00'  # Background
typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND='#ff9625'  # Orange

# ----------------------------------------------------------------------------
# Root Indicator
# ----------------------------------------------------------------------------
typeset -g POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND='#FF5555'  # Red
typeset -g POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND='#44475A'  # Current Line

# ----------------------------------------------------------------------------
# VCS (Git)
# ----------------------------------------------------------------------------
# Clean: Cyan - clearly different from warm colors used for dirty states
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND='#004900'       # Background
typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND='#50FA7B'       # Green
# Untracked: Pink - new files, attention needed
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='#720049'   # Background
typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='#FF79C6'   # Pink
# Modified: Orange - changes detected, more urgent
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='#953d00'    # Background
typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='#ff9625'    # Orange

# ----------------------------------------------------------------------------
# Status (exit code)
# ----------------------------------------------------------------------------
# Enable extended states for pipefail detection
typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true
# Show status on success (optional - can hide with false)
typeset -g POWERLEVEL9K_STATUS_OK=true
typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND='#50FA7B'       # Green
typeset -g POWERLEVEL9K_STATUS_OK_BACKGROUND='#004900'       # Background
# Error status
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND='#882828'    # Foreground
typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND='#FF5555'    # Red
# Pipe status (when any command in pipeline fails)
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND='#882828'
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND='#FF5555'

# ----------------------------------------------------------------------------
# Command Execution Time
# ----------------------------------------------------------------------------
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='#282A36'  # Background
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='#8BE9FD'  # Cyan
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0.5  # Show only if >0.5s

# ----------------------------------------------------------------------------
# Background Jobs
# ----------------------------------------------------------------------------
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='#282A36'  # Background
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='#BD93F9'  # Purple

# ----------------------------------------------------------------------------
# Context (user@host)
# ----------------------------------------------------------------------------
typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='#282A36'  # Background
typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='#50FA7B'  # Green
typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='#F8F8F2'     # Foreground
typeset -g POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='#FF5555'     # Red

# ----------------------------------------------------------------------------
# Virtualenv
# ----------------------------------------------------------------------------
typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND='#282A36'  # Background
typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND='#F1FA8C'  # Yellow

# ----------------------------------------------------------------------------
# Kubecontext
# ----------------------------------------------------------------------------
typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND='#282A36'  # Background
typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_BACKGROUND='#8BE9FD'  # Cyan

# ----------------------------------------------------------------------------
# Language Versions
# ----------------------------------------------------------------------------
# Go - Cyan
typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND='#282A36'
typeset -g POWERLEVEL9K_GO_VERSION_BACKGROUND='#8BE9FD'  # Cyan
# Java - Orange
typeset -g POWERLEVEL9K_JAVA_VERSION_FOREGROUND='#282A36'
typeset -g POWERLEVEL9K_JAVA_VERSION_BACKGROUND='#ff9625'  # Orange
# Node - Green
typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND='#282A36'
typeset -g POWERLEVEL9K_NODE_VERSION_BACKGROUND='#50FA7B'  # Green

# ----------------------------------------------------------------------------
# Icons & Separators (Powerline/Nerd Font)
# ----------------------------------------------------------------------------
# https://github.com/ryanoasis/powerline-extra-symbols#glyphs
typeset -g POWERLEVEL9K_ROOT_ICON="\uE780" # 
# Segment separators (rounded style between segments)
typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B4' 
typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\uE0B5'
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B6'
typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\uE0B7'

# Far end caps (diamond at outer edges, rounded at inner edges near gap)
# typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'  #  (diamond at far left)
# typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B4'     #  (rounded at inner left)
# typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B6' #  (rounded at inner right)
# typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'    #  (diamond at far right)


# Multiline prompt connectors (dim line)
# typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{240}╭%f"
# typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX="%F{240}├%f"
# typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{240}╰%f"
# typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX="%F{240}╮%f"
# typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX="%F{240}┤%f"
# typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX="%F{240}╯%f"

# ----------------------------------------------------------------------------
# Transient Prompt
# ----------------------------------------------------------------------------
# Replace full prompt with minimal char after command execution
typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
# Prompt char: green ❯ for user, red # for root
# Zsh expansion: %(!.root.user) - if privileged then root else user
typeset -g POWERLEVEL9K_PROMPT_CHAR_CONTENT_EXPANSION='%(!.%F{196}#.%F{076}❯)%f'

# ----------------------------------------------------------------------------
# Instant Prompt Mode
# ----------------------------------------------------------------------------
# 'verbose' shows warnings if instant prompt has issues
typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

