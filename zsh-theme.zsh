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
typeset -g POWERLEVEL9K_MODE='nerdfont-complete'

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
  # go_version
  # java_version
  # node_version
  kubecontext
)
# Show language versions only in project directories
typeset -g POWERLEVEL9K_JAVA_VERSION_PROJECT_ONLY=true
typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true
# Virtualenv: show only venv name, not full path or Python version
typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
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

# ----------------------------------------------------------------------------
# VCS (Git) Colors
# ----------------------------------------------------------------------------
# Color codes are xterm-256 palette numbers (0-255)
# Preview: https://www.ditig.com/publications/256-colors-cheat-sheet
# Clean repo: green background (color 070)
typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND='070'
# Untracked files: pink background (color 174)
typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='174'
# Modified files: olive text (058) on yellow background (220)
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='058'
typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='220'

# ----------------------------------------------------------------------------
# Context (user@host) Colors
# ----------------------------------------------------------------------------
# Default user: dark gray text (236) on olive background (143)
typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='236'
typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='143'
# Root user: red text (196) on dark red background (088)
typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='196'
typeset -g POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='088'

# ----------------------------------------------------------------------------
# OS Icon
# ----------------------------------------------------------------------------
# White background (255), blue foreground
typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=255
typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=blue

# ----------------------------------------------------------------------------
# Directory Colors
# ----------------------------------------------------------------------------
# White text (255) on blue background (063)
typeset -g POWERLEVEL9K_DIR_FOREGROUND=255
typeset -g POWERLEVEL9K_DIR_BACKGROUND=063
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=255
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=255

# ----------------------------------------------------------------------------
# Command Execution Time
# ----------------------------------------------------------------------------
# Dark blue text (017) on blue background (063)
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='017'
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='063'
# Show for all commands (threshold 0 seconds)
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0

# ----------------------------------------------------------------------------
# Directory Writable (Lock Icon)
# ----------------------------------------------------------------------------
# Yellow/orange text (220) on brown background (136)
typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND='220'
typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND='136'

# ----------------------------------------------------------------------------
# Root Indicator
# ----------------------------------------------------------------------------
# Red text (196) on dark red background (088)
typeset -g POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND='196'
typeset -g POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND='088'

# ----------------------------------------------------------------------------
# Icons & Separators (Powerline/Nerd Font)
# ----------------------------------------------------------------------------
# https://github.com/ryanoasis/powerline-extra-symbols#glyphs
typeset -g POWERLEVEL9K_ROOT_ICON="\uE780" # 
typeset -g POWERLEVEL9K_DIR_PATH_SEPARATOR=$'\uE0B5\u200A' #  + hair space
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
