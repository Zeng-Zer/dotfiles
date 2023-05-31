# fish disable welcome message
set fish_greeting

# set nvim as editor
set -gx EDITOR nvim
# set -gx TERM "screen-256color"

# Enable vim mode
set -g fish_key_bindings fish_vi_key_bindings
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

# vim keybind 
bind -M default \cr redo
bind -M insert \cf accept-autosuggestion
bind -M insert \cw forward-word

## Aliases
alias vim=nvim
# nvim edit confs
alias nef='nvim ~/.config/fish/config.fish -c "cd ~/.config/fish/"'
alias net='nvim ~/.config/tmux/tmux.conf -c "cd ~/.config/tmux/"'
alias nen='nvim ~/.config/nvim/ -c "cd ~/.config/nvim/"'
alias ney='nvim ~/.config/yabai/yabairc -c "cd ~/.config/yabai/"'
alias nes='nvim ~/.config/skhd/skhdrc -c "cd ~/.config/skhd/"'
alias nek='nvim ~/.config/kitty/kitty.conf -c "cd ~/.config/kitty/"'
alias nea='nvim ~/.config/alacritty/alacritty.yml -c "cd ~/.config/alacritty/"'
fish_add_path /Users/david/.spicetify
