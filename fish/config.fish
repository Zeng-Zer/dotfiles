alias vim=nvim

## ENABLE VIM MODE
set -g fish_key_bindings fish_vi_key_bindings
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

# bind -M insert \ck history-search-backward
# bind -M insert \cj history-search-forward
bind -M default \cr redo
bind -M insert \cf accept-autosuggestion


## disable tmux navigation if fzf is running
function isRunningFzF
  test string match -q -e -- (string trim (pgrep fzf | xargs ps -otty=)) (tty)
end
