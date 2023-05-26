## Enable vim mode
set -g fish_key_bindings fish_vi_key_bindings
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

set -gx EDITOR nvim

bind -M default \cr redo
bind -M insert \cf accept-autosuggestion

## Aliases
alias vim=nvim
# nvim edit confs
alias nef='nvim ~/.config/fish/config.fish -c "cd ~/.config/fish/"'
alias net='nvim ~/.config/tmux/tmux.conf -c "cd ~/.config/tmux/"'
alias nen='nvim ~/.config/nvim/ -c "cd ~/.config/nvim/"'
alias ney='nvim ~/.config/yabai/yabairc -c "cd ~/.config/yabai/"'
alias nes='nvim ~/.config/skhd/skhdrc -c "cd ~/.config/skhd/"'
