# Hehehe I stole this from Ryoku's repo

if test -d $HOME/.local/bin
    fish_add_path $HOME/.local/bin
end

if test -d $HOME/.cargo/bin
    fish_add_path $HOME/.cargo/bin
end

# point `go install` and `cargo install` at ~/.local/bin, and keep an existing
# editor choice.
set -gx GOBIN $HOME/.local/bin
set -gx CARGO_INSTALL_ROOT $HOME/.local
set -gx EDITOR nvim
set -gx VISUAL nvim

if status is-interactive
    # Aliases
    alias lg lazygit

    set -g fish_greeting

    set -g fish_color_normal F1F3E4
    set -g fish_color_command 60bf2d
    set -g fish_color_keyword e83b30
    set -g fish_color_param F1F3E4
    set -g fish_color_option CCD0CF
    set -g fish_color_quote A3C293
    set -g fish_color_redirection 8AA9CC
    set -g fish_color_end e83b30
    set -g fish_color_error FF6B6B
    set -g fish_color_comment 949699
    set -g fish_color_operator 93D4E0
    set -g fish_color_escape 93D4E0
    set -g fish_color_autosuggestion 949699

    # prompt.
    if command -v starship >/dev/null 2>&1
        starship init fish | source
    end

    # Zioxide
    if command -v zoxide >/dev/null 2>&1
        zoxide init fish --cmd cd | source
    end

    # fzf walks the tree via fd when present.
    if command -v fd >/dev/null 2>&1
        set -gx FZF_DEFAULT_COMMAND 'fd --hidden --follow --exclude .git'
        set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
        set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'
    end

    # fzf keys: Ctrl-R history, Ctrl-T files, Alt-C cd.
    if command -v fzf >/dev/null 2>&1
        fzf --fish | source
    end

    # eza listings.
    if command -v eza >/dev/null 2>&1
        alias ls 'eza -lh --group-directories-first --icons=auto'
        alias lsa 'ls -a'
        alias lt 'eza --tree --level=2 --long --icons --git'
        alias lta 'lt -a'
    end
end
