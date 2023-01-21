#!/usr/bin/env zsh

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir dir_writable root_indicator vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs)

# Directories
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# Color customization
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='070'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='174'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='058'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='220'

POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='236'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='143'

POWERLEVEL9K_USER_DEFAULT_FOREGROUND='236'
POWERLEVEL9K_USER_DEFAULT_BACKGROUND='143'
POWERLEVEL9K_USER_ROOT_FOREGROUND='196'

POWERLEVEL9K_HOST_LOCAL_FOREGROUND='236'
POWERLEVEL9K_HOST_LOCAL_BACKGROUND='149'

POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND='196'
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND='088'

POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"

POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=063
POWERLEVEL9K_DIR_HOME_BACKGROUND=063
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=063

POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='017'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='063'

POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND='220'
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND='136'

# Icons
POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_ROOT_ICON="\uE780" # 
POWERLEVEL9K_HOST_ICON="\uF109" # 
POWERLEVEL9K_SSH_ICON="\uF489" # 

POWERLEVEL9K_DIR_PATH_SEPARATOR=$'\uE0B5' # 

# https://github.com/ryanoasis/powerline-extra-symbols#glyphs
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B4' # 
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\uE0B5' # 
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B6' # 
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\uE0B7' # 
