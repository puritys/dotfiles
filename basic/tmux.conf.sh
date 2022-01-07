#!/bin/bash

if [ -f ~/.bash_theme ]; then
    . ~/.bash_theme
fi
cat <<EOF

# ---------
# Command
# ---------

# Create new tmux
# tmux new -s name

# Attach tmux
# tmux a -t name

# list tmux
# tmux ls

# ---------
# Key Binding
# ---------

# Bind Control+a to be prefix
unbind C-b
set -g prefix ^A
set -g focus-events on
bind a send-prefix

# Split window
bind s split-window -v
bind v split-window -h
bind | split-window -h
bind - split-window -v
bind z send-keys "Enter"\; send-keys "]"\; send-keys "^z"

# Window switch
# item2: add a mapping on profile keys, option+z = "+Esc z", option+x = "+Esc x"
bind-key -n M-z previous-window
bind-key -T copy-mode-vi M-z previous-window
bind-key -n M-x next-window
bind-key -T copy-mode-vi M-x next-window
bind-key -n C-left previous-window
bind-key -n C-right next-window

# Pannel Switch
unbind-key M-up ; bind-key -n M-up select-pane -U
unbind-key M-down  ; bind-key -n M-down select-pane -D
unbind-key M-Left  ; bind-key -n M-left select-pane -L
unbind-key M-right ; bind-key -n M-right select-pane -R

# Home / End
bind-key -n Home send Escape "OH"
bind-key -n End send Escape "OF"

# kill pannel
bind-key k kill-pane

# ----------
# Status Bar
# ----------
set -g status-justify left
set -g status-interval 120 # 120 sec refresh status

set -g status-bg '$ConstColorHexBgLevel3'
set -g status-fg '$ConstColorHexFgLevel1'
set -g status-right ''
set -g status-left '#[fg=$ConstColorHexFgSelLevel1]#S'
set -g status-left-length 10
set -g window-status-format "#[fg=$ConstColorHexFgLevel1,bg=$ConstColorHexBgLevel3] \ue0b1 #[fg=$ConstColorHexFgLevel0,bg=$ConstColorHexBgLevel3] #I #W"

set -g window-status-separator ""
set -g window-status-current-format "#[fg=$ConstColorHexBgLevel3,bg=$ConstColorHexBgLevel4]#[fg=$ConstColorHexFgLevel3,bg=$ConstColorHexBgLevel4] #I #W #[fg=$ConstColorHexBgLevel4,bg=$ConstColorHexBgLevel3]"

# ---------
# Basic Setting
# ---------
set -g default-terminal "xterm-256color"
set -g base-index 1
set -g visual-bell off
set -as terminal-overrides ",*:U8=0"

set -g history-limit 10000
set -g wrap-search off

set -g automatic-rename off
# printf '\ek%s\e\\' "title"
set -g allow-rename on
setw -g mode-keys vi
set-window-option -g xterm-keys on

# save command history to bash
set -g history-file ~/.bash_history


#set -g pane-border-fg '#585858'
#set -g pane-border-bg '#585858'
#set -g pane-active-border-fg '#585858'
#set -g pane-active-border-bg '#303030'

#set -g display-time 3000

# set 24-bit RGB color
set -g default-terminal screen-256color
set-option -ga terminal-overrides ",*256col*:Tc"


# Mouse Mode
#set -g mode-mouse off
#set -g mouse-resize-pane off
#set -g mouse-select-pane off
#set -g mouse-select-window off

EOF
