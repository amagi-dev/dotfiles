if status is-interactive
    # Commands to run in interactive sessions can go here
end


# eza へのエイリアス設定
if command -qv eza
    alias ls='eza --icons'
    alias ll='eza --icons -l --git'
    alias la='eza --icons -a'
    alias lla='eza --icons -la --git'
    alias tree='eza --icons --tree'
end

# Created by `pipx` on 2026-09-29 04:01:43
set PATH $PATH /home/amagi/.local/bin
